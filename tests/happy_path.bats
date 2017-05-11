#!/usr/bin/env bats

load helpers

@test "Sync with remote, PR OK" {
    new_commit
    push

    run bash -c "echo Y | git pretty-pull-request"

    debug
    expect_status 0
    [ $(echo "$output" | grep -c "OPENING PULL REQUEST") -eq 2 ]
}

@test "Not sync with remote, PR OK" {
    new_commit
    run bash -c "printf \"Y\nY\" | git pretty-pull-request"

    expect_status 0
    [ $(echo "$output" | grep -c "OPENING PULL REQUEST") -eq 2 ]
}
