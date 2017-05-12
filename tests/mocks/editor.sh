#!/usr/bin/env bash

function fake_editor {
    echo "This is a PR message" >> "$1"
}
EDITOR=fake_editor

