#!/bin/bash
set -xe

gpg --batch --yes -o cji.tar.gz -d cji.tar.gz.gpg
tar -vxzf cji.tar.gz
shred -vzuf cji.tar.gz
