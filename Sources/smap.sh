#!/bin/bash

# Find the location of the SMAP command
smap_location=$(where SMAP)

# Check if SMAP is found
if [ -n "$smap_location" ]; then
    # Run SMAP if found
    "$smap_location"
else
    echo "SMAP not found in the PATH."
fi

