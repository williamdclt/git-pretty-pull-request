#!/usr/bin/env bats

load helpers

@test "Branch is not in sync with remote" {
    new_commit
    run bash -c "echo n | git pretty-pull-request"

    expect_status 0
    [ $(echo "$output" | grep "Aborted") ]
}
