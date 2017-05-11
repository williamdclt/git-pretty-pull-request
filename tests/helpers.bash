#!/usr/bin/env bash

set -e


function setup() {
    cd /tmp/git-pretty-pull-request
    git reset --hard origin/testing
    git checkout -b "$BATS_TEST_NAME"
    git config pretty-pull-request.pull-bases "preprod prod"
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

function debug() {
    >&2 echo "============ DEBUG ============="
    >&2 echo "Exit status: $status"
    >&2 echo "Output:"
    >&2 echo "$output"
    >&2 echo "================================"
}
function expect_status() {
    [ $status -eq "$1" ]
}

function expect_output_contains() {
    [ $(echo "$output" | grep "$1") ]
}
