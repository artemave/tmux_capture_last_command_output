#!/usr/bin/env bash

x=$(tmux capture-pane -p -S '-' -J -t !)
readarray -t pane_contents <<<"$x"

# reverse loop through pane contents lines
for (( idx=${#pane_contents[@]}-2 ; idx>=0 ; idx-- )) ; do
  line=${pane_contents[idx]}

  # strip trailing whitespace from line
  line=$(sed 's/[[:space:]]*$//' <<<"$line")

  if [[ $line =~ "$PROMPT_PATTERN" ]]; then
    break
  fi

  # prepend line to result array
  result="$line"$'\n'"$result"
done

EDITOR_CMD=${EDITOR_CMD:-"$EDITOR -"}

echo "$result" | $EDITOR_CMD
