#!/bin/bash

readonly PROGNAME=$(basename $0)
readonly PROGDIR=$(cd "$(dirname "$0")"; pwd)
readonly ARGS="$@"
readonly PREFIX="geom-"

main() {
    local modules="core types meshops physics svg viz voxel webgl"

    for m in $modules
    do
        echo "testing module $PREFIX$m..."
        echo "----------------------------------------"
        cd $PROGDIR/$PREFIX$m/babel
        lein do clean
        lein test
        lein cljsbuild test
    done
}

main
