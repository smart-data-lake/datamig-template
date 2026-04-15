#!/usr/bin/env zsh
SCRIPTCALL=$0
WORKDIR=${SCRIPTCALL:h}
CONFIGDIR="${WORKDIR}/config"
JARNAME="datamig"

echo "Removing old left over"
rm -v ${WORKDIR}/dependency-reduced-pom.xml
rm -v ${WORKDIR}/*.jar
rm -v ${WORKDIR}/*.out
rm -v ${WORKDIR}/*.tar*
rm -r ${WORKDIR}/target

mvn clean install --no-transfer-progress --update-snapshots --activate-profiles fat-jar-with-spark,scala-2.13

echo "WORKDIR   = ${WORKDIR}"
echo "CONFIGDIR = ${CONFIGDIR}"
echo "JARNAME   = ${JARNAME}"

cp -rv ${WORKDIR}/src/main/sql ${WORKDIR}/target/*-jar-with-dependencies.jar ${WORKDIR}
cp -v ${WORKDIR}/src/main/shell/* ${WORKDIR}
chmod -v 0750 ${WORKDIR}/*sh

VERSION=$(ls *.jar | sed "s/${JARNAME}-//;s/-jar-with-dependencies.jar//")
BUNDLE_FILE="${JARNAME}-${VERSION}.tar"
BUNDLE_SRC_FILE="${JARNAME}-src-${VERSION}.tar"

echo "VERSION     = ${VERSION}"
echo "BUNDLE_FILE = ${BUNDLE_FILE}"

echo ""
echo "Creating Source TARball ${BUNDLE_SRC_FILE}"
tar -cf ${WORKDIR}/${BUNDLE_SRC_FILE} ${WORKDIR}/bundle.zsh ${WORKDIR}/pom.xml ${WORKDIR}/README.md ${WORKDIR}/src
xz -9v ${WORKDIR}/${BUNDLE_SRC_FILE}

echo ""
echo "Creating TARball ${BUNDLE_FILE}"
tar -cf ${WORKDIR}/${BUNDLE_FILE} ${CONFIGDIR} ${WORKDIR}/*.jar ${WORKDIR}/README.md ${WORKDIR}/sql ${WORKDIR}/setUp ${WORKDIR}/setUpLinuxVM.sh ${WORKDIR}/startSDLB.zsh

echo "Clean Up"
rm -rvf ${WORKDIR}/sql ${WORKDIR}/setUpLinuxVM.sh ${WORKDIR}/startSDLB.zsh

echo ""
echo "DONE :)"
ls -slhF ${WORKDIR}/*.tar*
exit $?
