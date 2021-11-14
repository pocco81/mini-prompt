<p align="center">
  <h2 align="center">🦊 MiniPrompt!</h2>
</p>

<p align="center">Minimal and versatile bash prompt</p>

<p align="center">
    <a href="https://github.com/Pocco81/MiniPrompt/stargazers"><img src="https://img.shields.io/github/stars/Pocco81/MiniPrompt?colorA=221e2f&colorB=b9c4e3&style=for-the-badge&logo=starship style=flat-square"></a>
    <a href="https://github.com/Pocco81/MiniPrompt/releases/latest"><img src="https://img.shields.io/github/release/Pocco81/MiniPrompt.svg?&style=for-the-badge&label=Release&logo=github&logoColor=eceff4&colorA=221e2f&colorB=f6bbe7"/></a>
    <a href="https://github.com/Pocco81/MiniPrompt/issues"><img src="https://img.shields.io/github/issues/Pocco81/MiniPrompt?colorA=221e2f&colorB=e7a988&style=for-the-badge"></a>
    <a href="https://github.com/Pocco81/MiniPrompt/network/members"><img src="https://img.shields.io/github/forks/Pocco81/MiniPrompt?colorA=221e2f&colorB=f0a8e4&style=for-the-badge&logo=github"></a>
</p>

## About

<div style="text-align: justify">
MiniPrompt is a minimal Bash prompt that aims to be as lightweight as possible while still being feature rich and user friendly enough to appeal to most users.
</div>

## 🎁 Features
- Colored exit status
- Easily configurable
- Fully customizable: colors, symbols, the prompt itself, and more...
- Better history
- Better completion
- Directory colors support
- Trimming path
- Various extensions
	- Git
	- Kubernetes
	- SSH
- Extensions can be toggled on and off on the fly

## 🤖 Usage

### 📦 Installation

under dev

### 🔧 Setup

MiniPrompt can be configured from a `conf.toml` file located under `${XDG_CONFIG_HOME}/miniprompt/conf.toml` (note: if the `$XDG_CONFIG_HOME` env var is not set then it'll be assumed to be `$HOME/.config/`). If the file does not exist the settings will be assumed.

Here is the default config:
```
# MiniPrompt's config file
[behaviour]
colored_exit_status = true
dirtrim = 2
enhanced_autocompletion = true
enhanced_history_format = true
dircolors = true

[primary_prompt]
prefix = "\[\e]0;\w\a\]"
ps_content = "</yellow>\w</nc></spc>"
succeeded = "green"
failed = "red"

[extensions]
ext_git = false
git_color = "cyan"
ext_ssh = false
ssh_color = "cyan"
ext_kubernetes = false
kubernetes_color = "cyan"

[symbols]
normal_mark = "➜"
error = "✗"
git_branch = ""
kube = ""
```

### 🌿 Utilization

under dev

## 🙋 FAQ

-   Q: **_"if I don't have a config file, will MiniPrompt create one for me?"_**
-   A: No, settings will simply be assumed from default values.

# 📜 License

MiniPrompt is released under the GPL v3.0 license. It grants open-source permissions for users including:

-   The right to download and run the software freely
-   The right to make changes to the software as desired
-   The right to redistribute copies of the software
-   The right to modify and distribute copies of new versions of the software

For more convoluted language, see the [LICENSE file](https://github.com/Pocco81/MiniPrompt/blob/main/README.md).

# 📋 TO-DO

**High Priority:**

-   Publish to NPM
- Publish AUR

**Low Priority:**

-   Finish README

<hr>
<p align="center">
	Enjoy!
</p>
