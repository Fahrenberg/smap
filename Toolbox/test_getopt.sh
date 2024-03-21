#!/bin/zsh

# Parse command-line options
ARGS=$(getopt ab:c "$@")

# Exit if getopt encounters an error
if [ $? -ne 0 ]; then
    exit 1
fi

# Set positional parameters to the parsed arguments
eval set -- "$ARGS"

# Loop through the parsed options
while true; do
    case "$1" in
        -a)
            echo "Option -a selected"
            shift
            ;;
        -b)
            echo "Option -b selected with argument: $2"
            shift 2
            ;;
        -c)
            echo "Option -c selected"
            shift
            ;;
        --)
            shift
            break
            ;;
        *)
            echo "Internal error!"
            exit 1
            ;;
    esac
done

# Process any remaining arguments
echo $arg
for arg  do
    echo "Non-option argument: $arg"
done

