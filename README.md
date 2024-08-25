# My Neovim Configuration

## Introduction

*This is a fork of [nvim-lua/kickstart.nvim](https://github.com/nvim-lua/kickstart.nvim) and [kickstart-modular.nvim](https://github.com/dam9000/kickstart-modular.nvim).*
## Installation

### Install Neovim

['stable'](https://github.com/neovim/neovim/releases/tag/stable) and latest
['nightly'](https://github.com/neovim/neovim/releases/tag/nightly) of Neovim.

### Install External Dependencies

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- Clipboard tool (xclip/xsel/win32yank or other depending on platform)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons
  - if you have it set `vim.g.have_nerd_font` in `init.lua` to true
- Language Setup:
  - If you want to write Typescript, you need `npm`
  - If you want to write Golang, you will need `go`
  - etc.

> **NOTE**
> See [Install Recipes](#Install-Recipes) for additional Windows and Linux specific notes
> and quick install snippets

### Install Kickstart

Neovim's configurations are located under the following paths, depending on your OS:

| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%localappdata%\nvim\` |
| Windows (powershell)| `$env:LOCALAPPDATA\nvim\` |

### Key Confgurations

#### Karabiner Configuration

```
{
    "description": "Caps Lock to Esc, Long Press is Left Control",
    "manipulators": [
        {
            "from": {
                "key_code": "caps_lock",
                "modifiers": {
                    "optional": [
                        "any"
                    ]
                }
            },
            "to": [
                {
                    "key_code": "left_control"
                }
            ],
            "to_if_alone": [
                {
                    "key_code": "escape"
                }
            ],
            "type": "basic"
        }
    ]
}
```

#### AutoHotKey Configuration

```
Persistent
InstallKeybdHook

SetTitleMatchMode 2
SetTimer DisableCaps, 100

; Disables CapsLock when WezTerm is active
DisableCaps()
{
    if WinActive("ahk_exe wezterm-gui.exe")
    {
        SetCapsLockState "AlwaysOff"
    }
    else
    {
        SetCapsLockState GetKeyState("CapsLock", "T")
    }
}

; If CapsLock is pressed on its own, it works like Escape.
; If it is held down, it functions like Left Control.
#HotIf WinActive("ahk_exe wezterm-gui.exe")
Capslock::
{
    Send "{LControl Down}"
    KeyWait "CapsLock"
    Send "{LControl Up}"
    if ( A_PriorKey = "CapsLock" )
    {
        Send "{Esc}"
    }
    return
}
```
