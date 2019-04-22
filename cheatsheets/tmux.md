---
title: Tmux
cheatsheet: Tmux
topic: Tmux shortcut keys
headergfx: false
credits: true
...


# Prefix {-}

Prefix key
: for shortcuts listed here if not mentioned otherwise

```
C-a * prefix
```

# Buffers {-}

Buffers 
: may be added using __copy-mode__ or the __set-buffer__ and
__load-buffer__ commands.

```
#   | list buffers
=   | choose buffer
]   | paste buffer	
```
	

# Miscelleanous {-}

Miscelleanous
:   \

```
R   * reload tmux configuration
?   | list keys
t   | show big clock
:   | enter command mode
i   | display message
~   | show messages
``` 

Commands
:   \

```
:list-commands # List the syntax
      of all commands
```


# Copy-mode {-}

Copy-mode
: in __vi-mode__. When in copy-mode the prefix key isn't needed for the commands
listed here.

```
[   | enter copy-mode
q   | quit copy-mode
Space | begin selection
Enter | copy-selection to buffer
V   | select line
W   | next WORD
v   | toggle rectangle selection
```

\vfill\null
\columnbreak


# Panes and windows {-}

Pane Navigation
: \@vim-tmux-navigator. The combos work without __prefix__

```
C-h * select left pane
C-j * select lower pane
C-k * select upper pane
C-l * select right pane
o   | select next pane
```

Pane actions
:   \

```
C-o | rotate panes forward
M-o | rotate panes backward
!   | break the current pane out
      of the window
;   | move to the previously ac-
      tive pain
q   | display pane index
m   | mark current pane
M   | clear the marked pane
x   | kill current pane
{   | swap pane with previous
      pane
}   | swap pane with next pane
M-[1-5] | arrange panes in preset
      layout
Space   | next layout
C-Arrow | Resize pane in arrow
      direction by 1
z   | toggle zoom
```

Window Navigation
: customized vim-like

```
C-h * select previous window (R)
C-l * select next window (R)
l   | select previous window
n   | select next window
0-9 | select window 0-9
w   | choose window (interactive)
'   | select window (prompt) 
s   | choose tree (interactive)
```


Window Actions
: partly modified in tmux.conf

```
c   | create new window
&   | kill window (confirm)
,   | rename current window
f   | prompt search in window
|   * split window vertically
-   * split window horizontally
```

\vfill\null
\columnbreak


# Sessions/Client {-}

Client navigation
:   \

```
D   | choose client (interactive)
L   | switch client
(   | switch to previous client
)   | switch to next client
```
Session actions
:   \

```
C-z | suspend client
d   | detach client
r   | refresh client
s   | open a zoomed pane to show
      sessions
X   * kill session (confirm)
```

# Legend {-}

Legend
: of this cheatsheet

```
* # modified shortcut
(confirm) # confirm before action
          with y/n
(interactive) # interactive dialog
          in a zoomed pane
(prompt)  # prompt for input in
          commandline
(R)       # repeatable
C # the CTRL key
M # the ALT key
```
