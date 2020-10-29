#!/bin/bash

pushd simple-chisel
git checkout simple-chisel-release
git pull origin simple-chisel-release
sbt publishLocal
popd

pushd q100
git checkout master
git pull origin master
popd

echo 'If the above instructions have been executed successfully, your repo has been updated successfully.'