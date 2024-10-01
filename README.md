<div align='center'>
   <p>
      <a href="https://github.com/m-krebs/nvim/blob/main/LICENSE">
         <picture>
            <source media="(prefers-color-scheme: dark)" type="image/svg+xml" srcset="https://img.shields.io/github/license/m-krebs/nvim.svg?color=cba6f7&labelColor=b4befe">
            <img src="https://img.shields.io/github/license/m-krebs/nvim.svg?color=8839ef" alt="MIT License"/>
         </picture>
      </a>
      <a href="https://github.com/neovim/neovim#is-also-awesome">
         <picture>
            <source media="(prefers-color-scheme: dark)" type="image/svg+xml" srcset="https://img.shields.io/badge/%3E%3D0.10.0-a6e3a1?logo=neovim&label=neovim&labelColor=74c7ec&logoColor=313244">
            <img alt="Neovim Logo" src="https://img.shields.io/badge/%3E%3D0.10.0-40a02b?logo=neovim&label=neovim&labelColor=1e66f5">
         </picture>
       </a>
   </p>
   <p>
     <div>My personal Neovim configuration.</div>
   </p>
</div>

## Installation

### Install Neovim

To download the latest stable version of Neovim, visit the 
[Neovim releases page](https://github.com/neovim/neovim/releases/tag/stable).

### Install External Dependencies

> **NOTE**
> [Backup](#FAQ) your previous configuration (if any exists)

External Requirements:
- Basic utils: `git`, `make`, `unzip`, C Compiler (`gcc`)
- [ripgrep](https://github.com/BurntSushi/ripgrep#installation)
- [fd](https://github.com/sharkdp/fd?tab=readme-ov-file#installation)
- A [Nerd Font](https://www.nerdfonts.com/): optional, provides various icons

> **NOTE**
> See [Windows Installation](#Windows-Installation) to double check any additional Windows notes

Neovim's configurations are located under the following paths, depending on your OS:

> Otherwise run `:echo stdpath('config')` in Neovim to find the correct path

| OS | PATH |
| :- | :--- |
| Linux, MacOS | `$XDG_CONFIG_HOME/nvim`, `~/.config/nvim` |
| Windows (cmd)| `%userprofile%\AppData\Local\nvim\` |
| Windows (powershell)| `$env:USERPROFILE\AppData\Local\nvim\` |

### Install configuration

> Make sure you checked the [Backup](#FAQ) section before proceeding

Clone this repository into your Neovim config directory:
```sh
git clone https://github.com/m-krebs/nvim.git ~/.config/nvim
```

If you just want to try the configuration, then use this temporary docker container:
```sh
docker run -w /root -it --rm alpine:edge sh -uelic '
  apk add git neovim ripgrep fd alpine-sdk --update
  git clone https://github.com/m-krebs/nvim ~/.config/nvim
  cd ~/.config/nvim
  nvim
'
```

### Post Installation

Start Neovim

```sh
nvim
```

Lazy will install all the plugins you have. Use `:Lazy` to view
current plugin status.

### FAQ

* What should I do if I already have a pre-existing neovim configuration?
  * You should back it up, then delete all files associated with it.
  * This includes your existing init.lua and the neovim files in `~/.local` which can be deleted with `rm -rf ~/.local/share/nvim/`

### Windows Installation

Installation may require installing build tools, and updating the run command for `telescope-fzf-native`

See `telescope-fzf-native` documentation for [more details](https://github.com/nvim-telescope/telescope-fzf-native.nvim#installation)

This requires:

- Install CMake, and the Microsoft C++ Build Tools on Windows

```lua
{'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' }
```

Alternatively one can install gcc and make which don't require changing the config,
the easiest way is to use choco:

1. install [chocolatey](https://chocolatey.org/install)
either follow the instructions on the page or use winget,
run in cmd as **admin**:
```
winget install --accept-source-agreements chocolatey.chocolatey
```

2. install all requirements using choco, exit previous cmd and
open a new one so that choco path is set, run in cmd as **admin**:
```
choco install -y neovim git ripgrep wget fd unzip gzip mingw make
```

After that you can follow the [Installinstallation) section.
