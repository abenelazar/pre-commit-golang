#!/usr/bin/env bash

cov=$(go tool cover -func coverage.out | grep total | awk '{print substr($3, 1, length($3)-3)}')
if [ $# -gt cov ]; then
    echo "coverage is below the threshold " $@ ". got " $COVERAGE
    exit 1
fi