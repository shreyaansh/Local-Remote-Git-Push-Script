#!/bin/bash -e
branch_name="$(git symbolic-ref HEAD | cut -d "/" -f 3)"
commit_message="$1"

read -p "Are you sure you're in the correct repository? (y/n): " yesno

if [ $yesno = "y" ]; then
	echo OK, executing script
elif [ $yesno = "n" ]; then
	echo Change to the correct repository and execute again
else
	echo None of the options selected exiting script
	exit 1
fi

if [ ! "$branch_name" ] || [ ! "$commit_message" ]; then
	echo "No commit message entered, exiting script :("
	exit 1
else
	git fetch --prune
	git add . && git commit -m "$commit_message" && git push origin "$branch_name:shreyaansh/$branch_name"
fi

