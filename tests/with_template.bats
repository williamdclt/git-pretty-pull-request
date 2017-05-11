#!/usr/bin/env bats

load helpers

@test "Edit the template then confirm" {
    echo "This is a template" > PULL_REQUEST
    new_commit
    push

    run bash -c "echo 'Y' | git pretty-pull-request"

    debug
    expect_status 0
    expect_output_contains "This is a template"
    expect_output_contains "This is a PR message"
}
