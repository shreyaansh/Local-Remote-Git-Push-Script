# Local-Remote Git Push Script

Script(c) I wrote for pushing my code from my local branch to the remote branch when working in a team environment with a lot of branches being sent for code review and stuff before the code getting pushed to master.

It gets the name of the current branch automatically without having to write it out.

Other helpful commands:

Alias for listing the names of all created local branches (put this line in .bashrc or .zshrc or whatever):

####llb = list local branches
```
alias llb='ls .git/refs/heads'
```
Alias for listing the names of all the created remote branches (do the same as the above command):

####lrb = list remote branches

This command assumes that your naming convention for a remote branch is ####user_name/branch_name.

It fetches the name of the remote repositories created by you and then removes origin/ from origin/repo_name as origin is the main remote repository stored in git.
 ```
alias lrb='git branch -r | grep $USER | cut -d "/" -f 2,3'
```
Command for getting the name of the current branch you're in to use for the git push command:
```
git symbolic-ref HEAD | cut -d "/" -f 3
```
