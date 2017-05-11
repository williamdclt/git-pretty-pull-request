#!/usr/bin/env bats

load helpers

@test "Pull base branches are not configured" {
    git config --unset pretty-pull-request.pull-bases
    new_commit
    run git pretty-pull-request

    expect_status 1
    expect_output_contains "The pull base branches are not configured"
}
