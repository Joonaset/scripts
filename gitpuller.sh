#!/bin/bash
# pull multiple repositories. Handy for automation
for t in $(cat repos.txt) ; do # read repo paths saved in repos.txt
		 git -C $t pull origin master
done;
