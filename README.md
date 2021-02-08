# gitscripts

## About

Automating pushing changes to the git server

## How to use (for linux)

Save script to /path/scriptdir/

set rights:
chmod u+w git-push.sh

run from launch project directory, where is the directory ".git"
/path/scriptdir/git-push.sh

## What the script does

1. checks for the existence of the ".git" directory

2. offers comment options for commit

3. adds all modified files

4. makes a commit with your comment in the format "YYYY-MM-DD HH:mm:ss your_comment"

5. sends data to the git server



