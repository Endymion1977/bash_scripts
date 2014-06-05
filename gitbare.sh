#!/bin/bash

cd /opt/repos
echo "Creating directory..."
mkdir $1
cd $1
echo "Setting up git..."
git --bare init
git config core.sharedRepository group
echo "Setting up permissions..."
chgrp -R git .
chmod -R g=u .
find . -type d -print0 | xargs -0 chmod g+s
cd ..
chown -R git:git $1
echo "Done!"
