#/bin/bash

cov=$(go tool cover -func coverage.out | grep total | awk '{print substr($3, 1, length($3)-3)}')
if [ $cov -lt $@ ]; then
    echo "coverage is below the threshold " $@ ". got " $COVERAGE
    exit 1
fi