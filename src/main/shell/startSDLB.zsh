#!/usr/bin/env zsh
set -o extendedglob
SCRIPTCALL=$0
WORKDIR=${SCRIPTCALL:h}
CONFIGDIR="${WORKDIR}/config"
SCRIPT_START_TIME=$(date "+%Y-%m-%d_%H%M%S")
LOGFILE="${WORKDIR}/${SCRIPTCALL:t:r}_${SCRIPT_START_TIME}.log"
JARNAME=$(ls *-jar-with-dependencies.jar | tail -1)
VERSION=$(ls *.jar | sed "s/${JARNAME}-//;s/-jar-with-dependencies.jar//")
FULLJARNAME="${WORKDIR}/${JARNAME}"

# default settings
ACTION=""
ENVIRONMENT="loc"
FEEDSEL=".*"
JAVA_HEAP_SPACE="-Xmx16g"
NOTIFICATION=""
STATS="false"

function logg {
    local tempus=$(date "+%Y-%m-%d_%H:%M:%S")
    echo $tempus"  "$*
}

function help() {
    echo "USAGE: ${SCRIPTCALL} <options> "
    echo
    echo "Specify at most one of the loading options a,c,l,p only!"
    echo
    echo "-a <ACTION_NAME> : only specify action will be executed"
    echo "    and corresponding table loaded. Other tables are not loaded."
    echo "    see config/actions.conf for all action names"
    echo
    echo "-c: the data in the source will be checked and invalid data loaded into the error tables"
    echo "    the other tables will not be loaded"
    echo
    echo "-e <test/int> : name of environment to use; default: ${ENVIRONMENT}"
    echo
    echo "-l: the data will be loaded only but not checked "
    echo
    echo "-m <number> : JAVA HEAP SPACE in Gibibyte (GiB); default: ${JAVA_HEAP_SPACE}"
    echo
    echo "-n <email> : to whom to send the nottification at the end; default: ${NOTIFICATION}"
    echo
    echo "-s: target DB will be vacuumed and data statistics will be calculated"
    echo
    echo "-t <directory name> : Java Io TmpDir"
    echo "    If not specified then JAVA's default is used"
    echo
    echo "If no parameter is set"
    echo "then all actions will be executed,"
    echo "i.e. all tables will be loaded and data checked."
}

# parsing parameters from script call
while getopts "a:ce:lm:n:st:h" option; do
    case $option in
    a) ACTION=${OPTARG} ;;
    c) FEEDSEL="check_.*" ;;
    e) ENVIRONMENT=${OPTARG} ;;
    l) FEEDSEL="load_.*" ;;
    m) JAVA_HEAP_SPACE="-Xmx$((OPTARG))g" ;;
    n) NOTIFICATION=${OPTARG} ;;
    s) STATS="true" ;;
    t) JAVA_IO_TMP="-Djava.io.tmpdir=${OPTARG}" ;;
    h)
        help
        exit 0
        ;;
    \?) # Invalid option
        logg "${SCRIPTCALL}: Invalid option"
        help
        exit 1
        ;;
    esac
done

source ${CONFIGDIR}/connection.zsh

if [[ -n "${ACTION}" ]]; then
    FEEDSEL="ids:${ACTION}"
fi

if [[ -z "${SOURCE_PW}" ]]; then
    vared -cep 'Please enter password for SOURCE database: ' SOURCE_PW
else
    logg "Password for source db already defined => not asking"
fi

if [[ -z "${TARGET_PW}" ]]; then
    vared -cep 'Please enter password for TARGET database: ' TARGET_PW
else
    logg "Password for target db already defined => not asking"
fi

export SOURCE_PW
export TARGET_PW

logg "The output of this script is redirected to ${LOGFILE}"

exec 1>>${LOGFILE} 2>>${LOGFILE}

logg "Start $0 $*"
logg "WORKDIR         = ${WORKDIR}"
logg "CONFIGDIR       = ${CONFIGDIR}"
echo ""
logg "ACTION          = ${ACTION}"
logg "ENVIRONMENT     = ${ENVIRONMENT}"
logg "FEEDSEL         = ${FEEDSEL}"
logg "JARNAME         = ${JARNAME}"
logg "JAVA_HEAP_SPACE = ${JAVA_HEAP_SPACE}"
logg "JAVA_IO_TMP     = ${JAVA_IO_TMP}"
logg "NOTIFICATION    = ${NOTIFICATION}"
logg "STATS           = ${STATS}"
logg "VERSION         = ${VERSION}"
echo ""
logg "SOURCE_HOST = ${SOURCE_HOST}"
logg "SOURCE_PORT = $((SOURCE_PORT))"
logg "SOURCE_DB   = ${SOURCE_DB}"
logg "SOURCE_USER = ${SOURCE_USER}"
echo ""
logg "TARGET_HOST = ${TARGET_HOST}"
logg "TARGET_PORT = $((TARGET_PORT))"
logg "TARGET_DB   = ${TARGET_DB}"
logg "TARGET_USER = ${TARGET_USER}"
logg "path to jar:"
echo ""
ls -shF ${FULLJARNAME}

ADD_OPENS=("--add-opens=java.base/sun.nio.ch=ALL-UNNAMED" "--add-opens=java.base/java.lang=ALL-UNNAMED" "--add-opens=java.base/java.lang.invoke=ALL-UNNAMED" "--add-opens=java.base/java.lang.reflect=ALL-UNNAMED" "--add-opens=java.base/java.io=ALL-UNNAMED" "--add-opens=java.base/java.net=ALL-UNNAMED" "--add-opens=java.base/java.nio=ALL-UNNAMED" "--add-opens=java.base/java.util=ALL-UNNAMED" "--add-opens=java.base/java.util.concurrent=ALL-UNNAMED" "--add-opens=java.base/java.util.concurrent.atomic=ALL-UNNAMED" "--add-opens=java.base/jdk.internal.ref=ALL-UNNAMED" "--add-opens=java.base/sun.nio.cs=ALL-UNNAMED" "--add-opens=java.base/sun.security.action=ALL-UNNAMED" "--add-opens=java.base/sun.util.calendar=ALL-UNNAMED")
SDLB_CMD="java ${ADD_OPENS[@]} -Dlog4j.configurationFile=${CONFIGDIR}/log4j2.yml -Dfile.encoding=UTF-8 ${JAVA_HEAP_SPACE} ${JAVA_IO_TMP} -jar ${FULLJARNAME} -c ${CONFIGDIR} --feed-sel '${FEEDSEL}' --master 'local[*]' --deploy-mode client"

logg "Starting Smart Datalake Builder"
echo ${SDLB_CMD}
STARTTIME=$(date +%s)
eval ${SDLB_CMD}
EXITCODE=$?

echo ""
logg "*** All SDLB actions terminated"
grep "finished writing" ${LOGFILE} >${LOGFILE}.tmp
cat ${LOGFILE}.tmp
rm ${LOGFILE}.tmp
echo ""

if [[ ${STATS} == "true" ]]; then
    logg "STATS=${STATS} psql: vacuum analyze on host ${TARGET_HOST}:$((TARGET_PORT))"
    psql --host=${TARGET_HOST} --username=${TARGET_USER} --port=$((TARGET_PORT)) --dbname=${TARGET_DB} --command "vacuum analyze" 2>/dev/null
    echo ""
    echo ""
    logg "psql: Executing sql/sourceCheck.sql on host ${SOURCE_HOST}:$((SOURCE_PORT)) , db ${SOURCE_DB}"
    echo ""
    psql --pset=footer=off --host=${SOURCE_HOST} --username=${SOURCE_USER} --port=$((SOURCE_PORT)) --dbname=${SOURCE_DB} --echo-queries --file=sql/sourceCheck.sql
    echo ""
    echo ""
    logg "psql: Executing sql/targetCheck.sql on host ${TARGET_HOST}:$((TARGET_PORT)) , db ${TARGET_DB}"
    echo ""
    psql --pset=footer=off --host=${TARGET_HOST} --username=${TARGET_USER} --port=$((TARGET_PORT)) --dbname=${TARGET_DB} --echo-queries --file=sql/targetCheck.sql
    echo ""
    echo ""
else
    logg "Since STATS = ${STATS}, no data statistics will be calculated"
fi

ENDTIME=$(date +%s)
logg "*** Done with $0 $*: EXITCODE=$((EXITCODE))"
logg "*** $0 $*: runtime = $((ENDTIME - STARTTIME)) seconds"
logg "*** Have a nice day :)"

if [[ -z "${NOTIFICATION}" ]]; then
    logg "Recipients address not specified => not sending mail"
else
    logg "Using mail to send notification to ${NOTIFICATION}"
    cat ${LOGFILE} | mail -s "SDLB run ${JARNAME} from ${SCRIPT_START_TIME}, EXITCODE=$((EXITCODE))" ${NOTIFICATION}
fi

exit $((EXITCODE))
