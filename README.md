# ZENODE Contracts

A lightweight repository that aims to bundle commonly used Solidity contracts, libraries and helper functions together.

This has been built by ZENODE and is licensed under the MIT-license (see [LICENSE.md](./LICENSE.md)).

## Overview

### Contracts

- [Ownable.sol](contracts/base/Ownable.sol)
  - Create ownable contracts
  - Adding and removing of administrators
  - Limiting read/write access
  - Ownership transference

### Libraries

\-

### Helpers

- [hardhat.js](helpers/hardhat.js) helper functions.

## Getting Started

Including this repository in your projects can be done in multiple ways:

- Adding it as a Git submodule to your project (recommended)
- Adding it as an npm module
- Git cloning (or downloading as a .zip)

### Add as a Git submodule

This is the approach I personally recommend for it clearly shows that this repository is a subset of your project. It could also give insight to which commit we're currently on and whether there have been changes to the <i>sub-repository</i>.

1. **Clone and stage the submodule**

   ```
   git submodule add -b main https://github.com/zenodeapp/zenode-contracts.git <destination_folder>
   ```

   > <i>\<destination_folder\></i> can be omitted, this will clone the repo in the current directory inside a folder named `zenode-contracts`.

2. **Commit and push**

   ```
   git commit -a -m "Added submodule zenode-contracts.git"
   git push
   ```

**Updating submodules (for in the future)**

To pull and incorporate the most recent changes, run this command inside the root of your main repository:

```
git submodule update --remote --recursive <path_to_submodule>
```

> Omit <i>\<path_to_submodule\></i> to update every submodule.

<br>
  
**Cloning repositories with submodules (for in the future)**

By default, cloning a repository with submodules won't include the files for every submodule. This may be considered a drawback as it requires extra knowledge and experience from your targeted audience.

Cloning the repo now requires an extra flag: `--recursive`.

```
git clone --recursive <url_to_repo_with_submodules> <destination_folder>
```

If you forgot to include the `--recursive` flag, you could always run the following git command to fetch all submodules:

```
git submodule update --init --recursive
```

> Here the `--recursive` flag is optional and only necessary if you have nested submodules (submodules containing submodules).

<br>

**Useful tip!**

The `git submodule foreach '[git action]'`-command is very useful when it comes to performing git actions on multiple submodules at once.

```
git submodule foreach 'git fetch'
git submodule foreach 'git diff ...origin'
```

> This example fetches all changes for every submodule and displays them in your terminal.

You can read more about Submodules in the [Git Documentation](https://git-scm.com/book/en/v2/Git-Tools-Submodules).

### Add as an npm module

This repository hasn't been registered as an npm module, but can be added as a dependency using a package manager of your choosing.

```
npm install zenodeapp/zenode-contracts
```

```
yarn add zenodeapp/zenode-contracts
```

> The syntax is <i>\<User name\></i>/<i>\<Repository name\></i>, which might be different for other package manager tools.

If you're interested in a specific branch, commit or tag, run the following command instead:

```
npm install zenodeapp/zenode-contracts#<branch/commit/tag>
```

```
yarn add zenodeapp/zenode-contracts#<branch/commit/tag>
```

Do have in mind that the usual approach to updating modules with your package manager will probably not work with git packages; re-install the package instead if you wish to pull the most recent changes to your project.

### Add by downloading or cloning

- Download .zip file on Github (top-right):

  ![download-zip](https://user-images.githubusercontent.com/108588903/197372280-df92e403-0805-4095-86b5-433f88773b52.png)

- Or, clone the repository using the command line:

  ```
  git clone https://github.com/zenodeapp/zenode-contracts.git <destination_folder>
  ```

  > Cloning creates a directory with the same name as the repo in the specified folder.
  >
  > > If you want to clone into the folder you're currently in, use '.' instead:
  > >
  > > ```
  > > git clone https://github.com/zenodeapp/zenode-contracts.git .
  > > ```

<br>

<p align="right">??? ZEN</p>
<p align="right">Copyright (c) 2022 ZENODE</p>
