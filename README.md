# sync_remote

Copy file from a local project root to a remote project root exported by REMOTE_PATH.

# Usage
From the root of the local project run:
```
sync-remote <SourceFile>
```
SourceFile should include the full relative path to its project root. 

# Example
Given the following:
```
REMOTE_PATH=user@host:/home/build/project 
SourceFile=/home/build/proj1/module1/src/foo.c
```
then running: 
```
sync-remote module1/src/foo.c
```
from:
```
/home/build/proj1
```
will result with: scp module1/src/foo.c user@host:/home/build/project/module1/src/foo.c

Remote dir is assumed to exist.
