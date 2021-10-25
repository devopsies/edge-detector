#!/bin/sh

tmp=`mktemp`

echo "Running predefined tests"

for d in `ls testdata`; do
    echo "Test $d"
    echo "Input:"
    cat testdata/$d/input.txt
    echo
    cat testdata/$d/input.txt | docker run -i --rm edge-detector > $tmp
    echo "Output:"
    cat $tmp
    if git diff -w --no-prefix --word-diff=color $tmp testdata/$d/expected-output.txt; then
        echo "OK"
    else
        echo "Failed !!!!"
        exit 1
    fi
    echo
done

echo "All predefined tests finished"

for d in `seq 10`; do
    input_file=$tmp-input-$d
    expected_file=$tmp-expected-$d
    actual_file=$tmp-actual-$d
    echo "Generating random test $d"
    (
        N=$(shuf -i 2-100 -n 1 -z)
        shuf -i 0-100 -n $N | tr '\n' ' '
        echo
    ) > $input_file
    cat $input_file | docker run -i --rm bara/infra-github-test-hs > $expected_file
    cat $input_file | docker run -i --rm edge-detector > $actual_file
    echo "Input:"
    cat $input_file
    echo "Output:"
    cat $actual_file
    if git diff -w --no-prefix --word-diff=color $actual_file $expected_file; then
        echo "OK"
    else
        echo "Failed !!!!"
        exit 1
    fi
    echo
done
