#!/usr/bin/env bash

set -e

setUpBeforeTestSuite() {
    export GIT_PRETTY_PR_TEST="true"  
    testDir=/tmp/git-pretty-pull-request/
    [ -e $testDir ] && rm -rf $testDir
    cp -r $suiteDir $testDir
    cd $testDir
    git config pretty-pull-request.pull-bases "preprod prod"
}

tearDownAfterTestSuite() {
    rm -rf $testDir
}

runTest() {
    bats 
}

suiteDir=$(cd $(dirname $0) && pwd)

#########################################
# Main
#########################################

setUpBeforeTestSuite

bats $suiteDir/tests

tearDownAfterTestSuite

