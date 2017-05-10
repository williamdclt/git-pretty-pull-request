#!/usr/bin/env bats

load helpers

@test "Pull base branches are not configured" {
    git config --unset pretty-pull-request.pull-bases
    git add a
    git commit -m "add a"
    run git pretty-pull-request

    expect_status 1
    expect_output_contains "The pull base branches are not configured"
}
