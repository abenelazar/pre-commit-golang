echo $1

cov=$(go tool cover -func coverage.out | grep total | awk '{print substr($3, 1, length($3)-3)}')
if [ $cov -lt $1 ]; then
    echo "coverage is below the threshold " $1 ". got " $COVERAGE
    exit 1
fi