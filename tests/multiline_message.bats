#!/usr/bin/env bats

load helpers

@test "Multiline message should be handled correctly" {
    new_commit
    push

    run bash -c 'echo Y | git pretty-pull-request "This is the PR message

it is clearly multiline"'

    expect_status 0
    [ $(echo "$output" | grep -c "This is the PR message") -eq 5 ]
    [ $(echo "$output" | grep -c "it is clearly multiline") -eq 3 ]

}
