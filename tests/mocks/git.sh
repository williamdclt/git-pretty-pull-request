#!/usr/bin/env bash

set -e

function git() {
    case "$1" in
        push)
            # The only push is "git push origin $head"
            # Instead, we'll simply create a origin/$head branch
            git branch origin/$3
            ;;
        fetch)
            # We don't need to really fetch for testing
            true
            ;;
        *)
            /usr/bin/git "$@"
            ;;
    esac
}
