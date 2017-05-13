#!/usr/bin/env bats

load helpers

@test "User writes a message in editor then abort" {
    echo "test" > PULL_REQUEST
    new_commit
    push

    run bash -c "echo N | git pretty-pull-request"
    
    expect_status 0
    expect_output_contains "Aborted"
    [ $(cat .git/PRETTY_PR_EDITMSG | grep 'test') ]
}

@test "User writes a message in editor then confirm" {
    echo "test" > PULL_REQUEST
    new_commit
    push

    run_PR
    
    expect_status 0
    [ $(echo "$output" | grep -c "OPENING PULL REQUEST") -eq 2 ]
    [ ! -e .git/PRETTY_PR_EDITMSG ]
}
