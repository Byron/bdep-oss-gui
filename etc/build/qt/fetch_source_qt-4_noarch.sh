#!/bin/bash
# NOTE: we are not executable, as the script should just serve as documnetation on how to get the source 
# we used to make the builds.
echo "We will clone the repository, and check it out in the branch that was latest last time we checked"
git clone git://gitorious.org/qt/qt.git 

tag=v4.8.6
git checkout $tag

echo "source checked out at $tag"
echo "Make sure you see the correct version of the source code"
echo "You should run a configuration script next"