# What is it?

This is a bash script for opening Github pull requests from your command line.

It allows to open multiple PRs at the same times (integration/preprod/prod for example) and to check the commits in each of these PRs, and handles PR templates.

It uses the `hub` by Github program, available [here](https://hub.github.com/).

# How to install it?

- Make sure you've installed [Hub](https://hub.github.com/).
- Download the git-pretty-pull-request script in this repository and make sure it's available in your $PATH (put it in /usr/local/bin for example).
- In each of your projects, set the branches on which you want to open pull requests: `git config pretty-pull-request.pull-bases "integration preprod prod"` (or set it globally with the `--global` option)
- (optional) `git pretty-pull-request` is tedious to type, I'd advise to alias it: `git config --global alias.pr pretty-pull-request`.

`git pr` is now an alias to `git pretty-pull-request`, which will call your git-pretty-pull-request script if it can be found in your $PATH!

# How to use it?

Instead of going on github and manually opening PRs, run `git pr` and tada! Check that the PRs that will be opened contain what you expect and confirm: that's it.

By default, git-pretty-pull-request uses your last commit message as PR message. You can also explicitely choose your PR message: `git pr "This is the PR message"`.
Additionally, if your project has a pull request template, your editor will be prompted to edit it.

# Contributing

All contributions, pull requests, issues or feature requests are very welcome!
If you want to submit pull requests, please test your contribution: we have a `tests` directory with some tests using [bats](https://github.com/sstephenson/bats)!
