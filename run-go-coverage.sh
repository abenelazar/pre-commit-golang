#!/usr/bin/env bash

if [ $# -ne 1 ]; then
  echo "accepts 1 param"
  echo $2
  echo $3
  echo $4
  echo $5
fi

THRESHOLD_PARAM=$1
THRESHOLD=${THRESHOLD_PARAM[1]}

echo $THRESHOLD
echo $THRESHOLD_PARAM

cov=$(go tool cover -func coverage.out | grep total | awk '{print substr($3, 1, length($3)-3)}')
if [[ $THRESHOLD -gt $cov ]]; then
    echo "coverage is below the threshold " $THRESHOLD ". got " $COVERAGE
    exit 1
fi

echo "coverage passed"