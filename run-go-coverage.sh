#!/usr/bin/env bash

if [ $# -ne 1 ]; then
  echo "accepts 1 param"
  echo $#
  exit 1
fi

cov=$(go tool cover -func coverage.out | grep total | awk '{print substr($3, 1, length($3)-3)}')
if [[ $1 -gt $cov ]]; then
    echo "coverage is below the threshold " $1 ". got " $COVERAGE
    exit 1
fi

echo "coverage passed"