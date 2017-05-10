#!/usr/bin/env bats

load helpers

@test "The pull base does not exist" {
    set_pull_bases "inexistant"
    new_commit
    push

    run git pretty-pull-request

    expect_status 1
    expect_output_contains "pull base doesn't exist"
}
