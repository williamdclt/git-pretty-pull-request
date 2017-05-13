#!/usr/bin/env bats

load helpers

@test "Edit the template then confirm" {
    use_template
    new_commit
    push

    run_PR

    expect_status 0
    expect_output_contains "This is a template"
    expect_output_contains "This is a PR message"
}

@test "Empty PR message should abort" {
    use_template
    new_commit
    push
    echo "" > editor_content

    run_PR

    expect_status 1
    expect_output_contains "empty pull request title"
}

@test "Comments in PR message are ignored" {
    use_template
    new_commit
    push

    echo "# This is a comment" > editor_content
    echo "This isn't" >> editor_content
    echo " # This isn't either" >> editor_content

    run_PR

    expect_status 0
    ! expect_output_contains "This is a comment"
    expect_output_contains "This isn't"
    expect_output_contains "This isn't either"
}

@test "Only comments in message abort PR" {
    use_template
    new_commit
    push

    echo "# This is a comment" > editor_content
    echo "# This is another" >> editor_content

    run_PR

    expect_status 1
    expect_output_contains "empty pull request title"
}

@test "Only comments and whitespaces in message abort PR" {
    use_template
    new_commit
    push

    echo "# This is a comment" > editor_content
    echo "" >> editor_content
    echo "     " >> editor_content
    echo "# Another comment" >> editor_content

    run_PR

    expect_status 1
    expect_output_contains "empty pull request title"
}

