#!/usr/bin/env bash

function fake_editor {
    if [ -e editor_content ]; then
        cat editor_content > "$1"
    else
        echo "This is a PR message" >> "$1"
    fi
}
EDITOR=fake_editor

