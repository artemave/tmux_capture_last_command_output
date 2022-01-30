#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

default_capture_key="t"
CAPTURE_KEY=$(tmux show-option -gqv @command-capture-key)
CAPTURE_KEY=${CAPTURE_KEY:-$default_capture_key}

PROMPT_PATTERN=$(tmux show-option -gqv @command-capture-prompt-pattern)
EDITOR_CMD=$(tmux show-option -gqv @command-capture-editor-cmd)

tmux bind $CAPTURE_KEY new-window -n last-command-output -e PROMPT_PATTERN="$PROMPT_PATTERN" -e EDITOR_CMD="$EDITOR_CMD" "$CURRENT_DIR/plugin.sh"
