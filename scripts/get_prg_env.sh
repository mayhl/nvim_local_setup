#!/usr/bin/env bash
echo $(module list 2>&1 | cut -d ')' -f2 | grep PrgEnv | xargs)
