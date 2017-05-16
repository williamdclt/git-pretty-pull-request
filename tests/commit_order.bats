#!/usr/bin/env bats

load helpers

@test "Check the prompted order of commits" {
    new_commit "first commit"
    new_commit "second commit"
    push

    run_PR

    # We only keep lines with the commit name in it
    # Then we number them and check that the first commit appears first
    echo "$output" | grep -e "first commit" -e "second commit" | nl | grep -e "1" -e "first"
}
