#!/bin/bash

echo "This Script show which directory is consume to much disk space"
find . -type d -print0 | xargs -0 du | sort -n | tail -10 | cut -f2 | xargs -I{} du -sh {}
