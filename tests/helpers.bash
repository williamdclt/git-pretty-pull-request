#!/usr/bin/env bash

function setup() {
    cd /tmp/git-pretty-pull-request
    git checkout testing
    git reset --hard origin/testing
    git checkout -b "$BATS_TEST_NAME"
    touch a b c d e f g h i j k l m n o p q r s t u v w x y z
}

function teardown() {
    true
}

# create an arbitrary commit
function new_commit() {
    file=$(date -Ins)
    touch "$file"
    git add "$file"
    git commit -m "add $file"
}

# Fake push
function push() {
    git branch origin/$(git rev-parse --abbrev-ref HEAD)
}

function set_pull_bases() {
    git config pretty-pull-request.pull-bases "$1"
}

function expect_status() {
    [ $status -eq "$1" ]
}

function expect_output_contains() {
    [ $(echo "$output" | grep "$1") ]
}
