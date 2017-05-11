#!/usr/bin/env bash

function fake_editor {
    echo "This is a PR message" >> "$1"
}
export EDITOR=fake_editor

