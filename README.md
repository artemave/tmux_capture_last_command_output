# Tmux Capture Last Command Output

Capture the output of the last terminal command and open it an editor in a separate tmux window. 

## Installation

### Using [TPM](https://github.com/tmux-plugins/tpm):

    set -g @plugin 'artemave/tmux_capture_last_command_output'

Hit <kbd>prefix</kbd> + <kbd>I</kbd> to fetch and source the plugin.

### Manual

Clone the repo:

    git clone https://github.com/artemave/tmux_capture_last_command_output.git ~/.tmux/plugins/tmux_capture_last_command_output

Source it in your `.tmux.conf`:

    run-shell ~/.tmux/plugins/tmux_capture_last_command_output/tmux_capture_last_command_output.tmux

Reload TMUX conf by running:

    tmux source-file ~/.tmux.conf

## Configuration

#### @command-capture-key

Required. Set Prefix + key to trigger the plugin. For example, `prefix+t`:

```
set -g @command-capture-key t
```

#### @command-capture-prompt-pattern

Required. A regexp to identify command separator. Usually a prompt. E.g., if set to '] % ', the plugin will capture the latest output up until the first line that contains '] % ':

```
set -g @command-capture-prompt-pattern '] % '
```

#### @command-capture-editor-cmd

Optional. An editor to use for the captured output. Defaults to `$EDITOR -`, which works with vim/nvim. Example:

```
set -g @command-capture-editor-cmd 'nvim -'
```
