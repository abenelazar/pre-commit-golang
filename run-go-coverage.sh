#!/usr/bin/env bash

THRESHOLD=$(echo $1 | awk '{print $2}')

COVERAGE=$(go tool cover -func coverage.out | grep total | awk '{print substr($3, 1, length($3)-3)}')
if [[ $THRESHOLD -gt $COVERAGE ]]; then
    echo "ERROR: coverage is below the required percentage: got" $COVERAGE"%, expected "$THRESHOLD"%"
    exit 1
fi
