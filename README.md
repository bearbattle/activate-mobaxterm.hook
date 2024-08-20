# Auto Activate MobaXterm - Chocolatey post install hook

[ ![ License: GPL v3 ]( https://img.shields.io/badge/License-GPLv3-blue.svg ) ]( https://www.gnu.org/licenses/gpl-3.0 ) [ ![Chocolatey package]( https://repology.org/badge/version-for-repo/chocolatey/activate-mobaxterm.hook.svg ) ]( https://repology.org/project/activate-mobaxterm.hook/versions )

A hook package that use python script to activate MobaXterm.

This hook package is designed to automatically activate MobaXterm after its installation.

## Downloads

### From Package Managers [Recommanded]

<a href="https://community.chocolatey.org/packages/activate-mobaxterm.hook"><img src="https://user-images.githubusercontent.com/716581/159197666-761d9b5e-18f6-427c-bae7-2cc6bd348b9a.png" height="108px" /></a>

[ ![Chocolatey package]( https://repology.org/badge/version-for-repo/chocolatey/activate-mobaxterm.hook.svg ) ]( https://repology.org/project/activate-mobaxterm.hook/versions )

### From Github Release

<a href="https://github.com/bearbattle/activate-mobaxterm.hook/releases/latest/download/activate-mobaxterm.hook.nupkg"><img src="https://img.shields.io/github/v/release/bearbattle/activate-mobaxterm.hook?display_name=tag&style=for-the-badge" height="65px" /></a>

### From Souce Code

> Step 1. Clone this repository:

With SSH:

`git clone git@github.com:bearbattle/activate-mobaxterm.hook.git`

With HTTPS:

`git clone https://github.com/bearbattle/activate-mobaxterm.hook.git`

With GitHub CLI:

`gh repo clone bearbattle/activate-mobaxterm.hook`

> Step 2. (Optional) Modify and review the code

> Step 3. Build the package

`choco package activate-mobaxterm.hook.nuspec`

> Step 4. Install the package

You shall use an Administrative Console for this command:

`choco install activate-mobaxterm.hook --source=.`

Or you can use `sudo` command: [ ![gsudo]( https://repology.org/badge/version-for-repo/chocolatey/gsudo.svg ) ]( https://repology.org/project/gsudo/versions ) <img src="https://img.shields.io/github/v/release/gerardog/gsudo?display_name=tag" />

`sudo choco install activate-mobaxterm.hook --source=.`

## Usage

Just download and install it with `choco` and reinstall `mobaxterm`, the post-install script shall automatically generate and place the license file `Custom.mxtpro` to the installation folder.

```powershell
choco install -y activate-mobaxterm.hook
choco install -fy mobaxterm
```

## Package Parameters

The following package parameters can be set:

* `/UserName:` - Name licensed to, appears on liscense info (default: Current Windows Username `$Env:UserName`)

Thanks to https://github.com/flygon2018/MobaXterm-keygen

This software is published under GPL-3.0 License
