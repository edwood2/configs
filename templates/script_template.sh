#!/usr/bin/env bash
#
# template for my bash scripts

set -euo pipefail
if [[ "${TRACE-0}" == "1" ]]; then
    # enable it via "TRACE=1 ./script.sh ..."
    set -x
fi

#TODO: BASH_SOURCE[0]

usage () {
cat << EOF
USAGE:
    script.sh [ -hdv ]
              [ -o outfile_path ]
              infile_path

Brief description of the script.

OPTIONS:

-h --help
    Display this message and exit 0

-d --debug
    Enables debug mode

-v --verbose
    Increase verbosity level.

-o --output [outfile_path]
    Output file, full path.

EXAMPLE
    $ script.sh -d -v -o myoutput.log inputfile.txt
EOF
}


ARGS=$(getopt --options='hdo:l::v' --longoptions='help,debug,output:,lang::,verbose' --name "$0" -- "$@") || exit
if [ $# -eq 0 ] ; then usage ; exit 1; fi
eval "set -- $ARGS"

VERBOSE=0
DEBUG=n
LANG=ger
outFile=e

while true; do
    case $1 in
      -d|--debug)
            DEBUG=y
            shift
            ;;
      -v|--verbose)
            ((++VERBOSE))
            shift
            ;;
      -o|--output)
            outFile="$2"
            shift 2
            ;;
      -l|--lang)
            # handle optional: getopt normalizes it into an empty string
            LANG=${2:-"eng"}
            shift 2
            ;;
      -h|--help)
            usage
            exit 0
            ;;
      --)   shift
            break
            ;;
      *)    echo "ERROR" >&2
            exit 1  # error
            ;;
    esac
done

echo "Debug =" $DEBUG", Outfile =" "$outFile", Infile = "$1"
