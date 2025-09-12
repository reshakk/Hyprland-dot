## Sessions

tmux - Start a new session
tmux new - Start a new session 
tmux new-session - Start a new session
: new - Start a new session

tmux new-session -A -s mysession - Start a new session or attach to an existing session named mysession

tmux new -s mysession - Start a new session with the name mysession
: new -s mysession - Start a new session with the name mysession

: kill-session - kill/delete the current session

tmux kill-ses -t mysession - kill/delete session mysession
tmux kill-session -t mysession - kill/delete session mysession

tmux kill-session -a - kill/delete all sessions but the current

tmux kill-session -a -t mysession - kill/delete all sessions but mysession

Ctrl + b $ - Rename session

Ctrl + b d - Detach from session

: attach -d - Detach others on the session (Maximize window by detach other clients)

tmux ls - Show all sessions
tmux list-sessions - Show all sessions
Ctrl + b s - Show all sessions

tmux a - Attach to last session
tmux at - Attach to last session
tmux attach - Attach to last session
tmux attach-session - Attach to last session

tmux a -t mysession - Attach to a session with the name mysession
tmux at -t mysession - Attach to a session with the name mysession
tmux attach -t mysession - Attach to a session with the name mysession
tmux attach-session -t mysession - Attach to a session with the name mysession

Ctrl + b w - Session and Window Preview

Ctrl + b ( - Move to previous session

Ctrl + b ) - Move to next session

## Windows

tmux new -s mysession -n mywindow - start a new session with the name mysession and window mywindow

Ctrl + b c - Create window

Ctrl + b , - Rename current window

Ctrl + b & - Close current window

Ctrl + b w - List windows

Ctrl + b p - Previous window

Ctrl + b n - Next window

Ctrl + b 0 ... 9 - Switch/select window by number

Ctrl + b l - Toggle last active window

: swap-window -s 2 -t 1 - Reorder window, swap window number 2(src) and 1(dst)

: swap-window -t -1 - Move current window to the left by one position

: move-window -s src_ses:win -t target_ses:win - Move window from source to target
: movew -s foo:0 -t bar:9 - Move window from source to target
: movew -s 0:0 -t 1:9 - Move window from source to target

: move-window -s src_session:src_window - Reposition window in the current session
: movew -s 0:9 - Reposition window in the current session

: move-window -r - Renumber windows to remove gap in the sequence
: movew -r - Renumber windows to remove gap in the sequence

## Panes

Ctrl + b ; - Toggle last active pane

: split-window -h - Split the current pane with a vertical line to create a horizontal layout
Ctrl + b % - Split the current pane with a vertical line to create a horizontal layout

: split-window -v - Split the current with a horizontal line to create a vertical layout
Ctrl + b " - Split the current with a horizontal line to create a vertical layout

: join-pane -s 2 -t 1 - Join two windows as panes (Merge window 2 to window 1 as panes)

: join-pane -s 2.1 -t 1.0 - Move pane from one window to another (Move pane 1 from window 2 to pane after 0 of window 1)

Ctrl + b { - Move the current pane left

Ctrl + b } - Move the current pane right

Ctrl + b ↑ - Switch to pane to the direction
Ctrl + b ↓ - Switch to pane to the direction
Ctrl + b ← - Switch to pane to the direction
Ctrl + b → - Switch to pane to the direction

: setw synchronize-panes - Toggle synchronize-panes(send command to all panes)

Ctrl + b Spacebar - Toggle between pane layouts

Ctrl + b o - Switch to next pane

Ctrl + b q - Show pane numbers

Ctrl + b q 0 ... 9 - Switch/select pane by number

Ctrl + b z - Toggle pane zoom

Ctrl + b ! - Convert pane into a window

Ctrl + b + ↑ - Resize current pane height(holding second key is optional)
Ctrl + b Ctrl + ↑ - Resize current pane height(holding second key is optional)
Ctrl + b + ↓ - Resize current pane height(holding second key is optional)
Ctrl + b Ctrl + ↓ - Resize current pane height(holding second key is optional)

Ctrl + b + ← - Resize current pane width(holding second key is optional)
Ctrl + b Ctrl + ← - Resize current pane width(holding second key is optional)
Ctrl + b + → - Resize current pane width(holding second key is optional)
Ctrl + b Ctrl + → - Resize current pane width(holding second key is optional)

Ctrl + b x - Close current pane

## Copy Mode

: setw -g mode-keys vi - use vi keys in buffer

Ctrl + b [ - Enter copy mode

Ctrl + b PgUp - Enter copy mode and scroll one page up

q - Quit mode

g - Go to top line

G - Go to bottom line

↑ - Scroll up

↓ - Scroll down

h - Move cursor left

j - Move cursor down

k - Move cursor up

l - Move cursor right

w - Move cursor forward one word at a time

b - Move cursor backward one word at a time

/ - Search forward

? - Search backward

n - Next keyword occurance

N - Previous keyword occurance

Spacebar - Start selection

Esc - Clear selection

Enter - Copy selection

Ctrl + b ] - Paste contents of buffer_0

: show-buffer - display buffer_0 contents

: capture-pane - copy entire visible contents of pane to a buffer

: list-buffers - Show all buffers

: choose-buffer - Show all buffers and paste selected

: save-buffer buf.txt - Save buffer contents to buf.txt

: delete-buffer -b 1 - delete buffer_1

## Misc

Ctrl + b : - Enter command mode

: set -g OPTION - Set OPTION for all sessions

: setw -g OPTION - Set OPTION for all windows

: set mouse on - Enable mouse mode

## Help

tmux list-keys - List key bindings(shortcuts)
: list-keys - List key bindings(shortcuts)
Ctrl + b ? - List key bindings(shortcuts)

tmux info - Show every session, window, pane, etc...
