#!/bin/sh
mkdir -p bin
cobc -x ./variables.cob -o bin/variables
cobc -x ./sum.cob -o bin/sum
cobc -x ./file_test.cob -o bin/file_test
cobc -x ./rw_students.cob -o bin/rw_students.cob