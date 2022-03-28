#
# Should be run from project root dir (where .git is)
#

srcFiles=$*

if [ -z ${REMOTE_PATH+x} ]; then
  echo "REMOTE_PATH not set. Please export REMOTE_PATH=user@host:/path/to/remote/root"
  exit 1
fi

if [ "$srcFiles" == "" ]; then
  cat <<EOF
  
Copy file from a local project root to a remote project root exported by REMOTE_PATH.

Usage: sync-remote <SourceFile>

The command should be run from the root of the local project.
SourceFile should include the full relative path to its project root. 

If the following is set:
SourceFile=/home/build/proj1/module1/src/foo.c 
REMOTE_PATH=user@host:/home/build/project 
then running: sync-remote module1/src/foo.c
from: /home/build/proj1
will result with: scp module1/src/foo.c user@host:/home/build/project/module1/src/foo.c
Remote dir is assumed to exist.
EOF
  exit 1
fi

for srcFile in $srcFiles; do 
  scp $srcFile $REMOTE_PATH/$srcFile
done
