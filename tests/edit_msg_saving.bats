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

    [ x"$(git rev-parse $BATS_TEST_NAME)" == x"$(git rev-parse origin/$BATS_TEST_NAME)" ]
    run bash -c "echo Y | git pretty-pull-request"
    
    expect_status 0
    [ $(echo "$output" | grep -c "test URL") -eq 2 ]
    [ ! -e .git/PRETTY_PR_EDITMSG ]
}
