#!/usr/bin/env bash

function fake_editor {
    echo "$1" >> .git/PRETTY_PR_EDITMSG
}
export EDITOR=fake_editor

