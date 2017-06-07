# Local-Remote Git Push Script

Script(s) I wrote for pushing my code from my local branch to the remote branch when working in a team environment with every feature being worked on a different local branch which is then pushed to a remote branch to be code reviewed, and when approved to be sent for QA testing, which when done, finally getting _merged_ (local master) and then _pushed_ (remote master) to master.

This repository and readme is made to help me remember more about how **_git_** works when working in a team environment and also how it works in general.

It gets the name of the current branch automatically without having to write it out.

## Other helpful commands:

### Alias for listing the names of all created local branches (put this line in .bashrc or .zshrc or whatever):

**llb** = **l**ist **l**ocal **b**ranches
```
alias llb='ls .git/refs/heads'
```
### Alias for listing the names of all the created remote branches (do the same as the above command):

**lrb** = **l**ist **r**emote **b**ranches

This command assumes that your naming convention for a remote branch is **user_name/branch_name**.

It fetches the name of the remote repositories created by you and then removes _origin/_ from _origin/repo_name_ as _origin_ is the main remote repository stored in git with _master_ as the default branch. When you work in a local copy of your repository, the local repository's main branch will be referred to as _origin/master_
 ```
alias lrb='git branch -r | grep $USER | cut -d "/" -f 2,3'
```
Command for getting the name of the current branch you're in to use for the git push command:
```
git symbolic-ref HEAD | cut -d "/" -f 3
```

### Review before using the make script to push changes on to the remote repository for code review and further steps:

Using git difftool is a very good resource to view the changes made across either your commits or your branches.

Just using difftool command in git will pull up your changes between your code state now vs the last commit you made on your local branch.
```
git difftool
```
Putting the name of the remote/local repository/branch would actually pull up the differences between the difference in code between the branch that you are writing your code in vs the remote/local repository/branch (in most cases probably origin/master(local) or origin master (remote)) that you want to compare to.
```
git difftool origin/master (for local master branch)
git difftool origin master (for remote master branch)
```

Also, if you are working in a big team with your own **_make_** script which is different than what other people are using, it would be better to put the name of your make script in the **_.git/info/exclude_** file which is available and unique to each contributor rather than putting it in the **_.gitignore_** file which is common to everyone working in the same repository.
