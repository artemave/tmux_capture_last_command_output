#!/usr/bin/env bash

x=$(tmux capture-pane -p -S '-' -J -t !)
PROMPT_PATTERN=${PROMPT_PATTERN:-" ] % "}
result=$(echo "$x" | tac | sed -e "0,/$PROMPT_PATTERN/d" | sed "/$PROMPT_PATTERN/,\$d" | tac)

EDITOR_CMD=${EDITOR_CMD:-"$EDITOR -"}

echo "$result" | $EDITOR_CMD
