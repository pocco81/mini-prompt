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

-   Colored exit status
-   Easily configurable
-   Fully customizable: colors, symbols, the prompt itself, and more...
-   Better history
-   Better completion
-   Directory colors support
-   Trimming path
-   Various extensions
    -   Git
    -   Kubernetes
    -   SSH
    -   IP address
    -   WIFI
-   Extensions can be toggled on and off on the fly

## 🤖 Usage

### 📦 Installation

Make sure you have the following programs installed in your system:

+ GNU Make
+ `git`
+ `npm` (for the npm installer)
+ A patched [Nerd Font](https://www.nerdfonts.com/) (optional)

#### NPM

```
$ npm install --global miniprompt.sh
```

#### Manual

```sh
$ git clone git@github.com:Pocco81/MiniPrompt.git && cd MiniPrompt
$ make install
```

> Installs the prompt under your local bins: `~/.local/bin`. Make sure this directory is in your `$PATH`; if it's not, paste this into your `~/.bashrc`:

```sh
export PATH=$PATH:"$HOME/.local/bin"
```

#### AUR

```sh
👷🛑 Under dev
```
### 🔧 Setup

Two things:

1. Enable the prompt in your `~/.bashrc`
2. Configure it

To enable the prompt paste this into your `~/.bashrc`:

```sh
alias mp="source miniprompt"
mp
```

After that, feel free to customize the prompt to your like using the `conf.toml` file (located under `${XDG_CONFIG_HOME}/miniprompt/conf.toml`. If the `$XDG_CONFIG_HOME` env var is not set then it'll be assumed to be `$HOME/.config/`).

Here is the [default config](https://github.com/Pocco81/MiniPrompt/blob/main/config/conf.toml):

```toml
# MiniPrompt's config file
[behaviour]
colored_exit_status = true			# prettify the exit status of the previous command
dirtrim = 2			# trim the CWD to only show x number of dirs
enhanced_autocompletion = true			# completion maps, tilde expansion, mark directories, ...
enhanced_history_format = true			# better format for your shell history: [%Y-%m-%d %T]
dircolors = true			# color directories

[primary_prompt]
prefix = "\[\e]0;\w\a\]"			# prompt prefix
ps_content = "</yellow>\w</nc> "			# the actual content of your prompt
ps_suffix = "</green>➜</nc> "		# after the ps_content
normal_color = "nc"			# the color text is defaulted to
error_symbol = "✗"			# symbol to use after the previous command failed
failed = "red"			# $error_mark's color after the previous command executed successfully

[extensions]
ext_git = false			# enable git extension (shows current working branch)
ext_ssh = false			# enable ssh expansion (shows <user>@<machine>)
ext_package = false			# enable package expansion (shows project's current version)
ext_kubernetes = false			# enable kubernetes extension (shows kubernetes' current context)
ext_ip = false			# enable kubernetes extension (shows kubernetes' current context)
ext_wifi = false
git_struct = "</cyan> </unit> "		# structure of the integration
ssh_struct = "</magenta> </unit> " # structure of the integration
package_struct = "</white> v</unit> " # structure of the integration
ip_struct = "</gray_br>  </unit> " # structure of the integration
wifi_struct = "</blue>直 </unit> " # structure of the integration
hierarchy = "ssh, git, ip, wifi, package" # order in which the extensions are displayed
```

#### Customizing!

##### Prompt

The prompt itself can be changed modifying the `ps_content` and `ps_suffix` variables. Apart from giving your prompt different colors using the [tags](#tags), you can also modify the information displayed using the following built-in Bash options:

| Opts         | Description                                             |
| ------------ | ------------------------------------------------------- |
| `\a`         | A bell character                                        |
| `\d`         | Date (day/month/date)                                   |
| `\D{format}` | Date but following the system's time format             |
| `\e`         | Escape character                                        |
| `\h`         | Hostname (short)                                        |
| `\H`         | Full hostname (domain name)                             |
| `\j`         | Number of jobs being managed by the shell               |
| `\l`         | The basename of the shells terminal device              |
| `\n`         | New line                                                |
| `\r`         | Carriage return                                         |
| `\s`         | The name of the shell                                   |
| `\t`         | Time (hour:minute:second)                               |
| `\@`         | Time, 12-hour AM/PM                                     |
| `\A`         | Time, 24-hour, without seconds                          |
| `\u`         | Current username                                        |
| `\v`         | BASH version                                            |
| `\V`         | Extra information about the BASH version                |
| `\w`         | Current working directory                               |
| `\W`         | The basename of the working directory                   |
| `\!`         | Lists this command’s number in the history              |
| `\#`         | This command’s command number                           |
| `\$`         | Specifies whether the user is root (#) or otherwise ($) |
| `\\`         | Backslash                                               |
| `\[`         | Start a sequence of non-displayed characters            |
| `\]`         | Close or end a sequence of non-displayed characters     |

##### Structs

Structs define the structure of the extensions. You can use tags to customize the structs further. However, there is an additional tag called `</unit>`, which is the output of the extension. Say you are using the git extension:

```sh
git_struct = "</cyan> </unit> "
```

This will display:

```sh
 dev
```

Because `</unit>` in this case, displays the current working branch.

##### Tags

| Tag          | Description                            |
| ------------ | -------------------------------------- |
| `</gray>`    | Makes text following it gray           |
| `</red>`     | Makes text following it red            |
| `</green>`   | Makes text following it green          |
| `</blue>`    | Makes text following it blue           |
| `</cyan>`    | Makes text following it cyan           |
| `</yellow>`  | Makes text following it yellow         |
| `</magenta>` | Makes text following it magenta        |
| `</white>`   | Makes text following it white          |
| `</nc>`      | Removes the color of text following it |

You can also give some properties to the colors by using modifiers and appending them at the end of the color (e.g. `<green_br>`):

| Modifier | Description |
| -------- | ----------- |
| `_br`    | bright      |
| `_dm`    | dim         |
| `_it`    | italic      |
| `_un`    | underlined  |
| `_bl`    | blinking    |
| `_re`    | inverted    |

### 🌿 Utilization

#### On the fly commands

On the previous step we created the alias `mp`, which we will be using to run commands for MiniPrompt. Use `mp --help` to see the available commands. Here is a quick example enabling the Git extension:

```sh
$ mp git enable
# you can shorten it as: mp gt e
```

## 🙋 FAQ

-   Q: **_"If I don't have a config file, will MiniPrompt create one for me?"_**
-   A: No, settings will simply be assumed from default values.

-   Q: **_"Why does the alias created for the prompt needs to be sourced?"_**
-   A: Because you can't export env vars from a shell script unless it's sourced, so [this](https://stackoverflow.com/questions/16618071/can-i-export-a-variable-to-the-environment-from-a-bash-script-without-sourcing-i) is the best solution.

## 📜 License

MiniPrompt is released under the GPL v3.0 license. It grants open-source permissions for users including:

-   The right to download and run the software freely
-   The right to make changes to the software as desired
-   The right to redistribute copies of the software
-   The right to modify and distribute copies of new versions of the software

For more convoluted language, see the [LICENSE file](https://github.com/Pocco81/MiniPrompt/blob/main/README.md).

# 📋 TO-DO

**High Priority:**

-   Publish to NPM
-   Publish AUR

**Low Priority:**

-   Finish README

<hr>
<p align="center">
	Enjoy!
</p>
