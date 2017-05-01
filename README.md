# What is it?

This is a bash script for opening Github pull requests from your command line.

It allows to open multiple PRs at the same times (integration/preprod/prod for example) and to check the commits in each of these PRs.

It uses the `hub` by Github program, available [here](https://hub.github.com/).

# How to use it?

Make sure you've downloaded [Hub](https://hub.github.com/).

Download the git-pretty-pull-request script in this repository and make sure it's available in your $PATH (put it in /usr/local/bin for example).

Update the first two lines of the script to specify the base branches of each pull request.

Add the following to your ~/.gitconfig:

```
[alias]
    pr = pretty-pull-request
```

`git pr` is now an alias to `git pretty-pull-request`, which will call your git-pretty-pull-request script (while it is in your $PATH of course).
