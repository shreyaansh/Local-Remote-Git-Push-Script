# Local Branch Push Scripts

Script I wrote for pushing my code from my local branch to the remote branch.

It gets the name of the current branch automatically without having to write it out.

Other helpful commands:

Alias for listing the names of all created local branches (put this line in .bashrc or .zshrc or whatever):
```
alias lb='ls .git/refs/heads'
```
Command for getting the name of the current branch you're in to use for the git push command:
```
git symbolic-ref HEAD | cut -d "/" -f 3
```
