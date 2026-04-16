#!/usr/bin/env zsh

## if you do not want to set password in this file
## you may do so by removing the lines defining SOURCE_PW and TARGET_PW.
## The start script startSDLB.zsh will ask you for the password which is not set
## as environment variable.

case ${ENVIRONMENT} in
loc)
    export SOURCE_DB="sdlb"
    export SOURCE_DRIVER="org.postgresql.Driver"
    export SOURCE_HOST="localhost"
    export SOURCE_PORT="5432"
    export SOURCE_PW="sdlb"
    export SOURCE_USER="sdlb"

    export TARGET_DB="sdlb"
    export TARGET_DRIVER="org.postgresql.Driver"
    export TARGET_HOST="localhost"
    export TARGET_PORT="5432"
    export TARGET_PW="sdlb"
    export TARGET_USER="sdlb"
    ;;
*)
    export SOURCE_DB=""
    export SOURCE_DRIVER=""
    export SOURCE_HOST=""
    export SOURCE_PORT=""
    export SOURCE_USER=""

    export TARGET_DB=""
    export TARGET_DRIVER=""
    export TARGET_HOST=""
    export TARGET_PORT=""
    export TARGET_USER=""
    ;;
esac
