#!/bin/bash

pushd simple-chisel
git checkout simple-chisel-release
git pull origin
sbt publishLocal
popd

pushd q100
git checkout master
git pull origin
popd

echo 'If the above instructions have been executed successfully, your repo has been updated successfully.'