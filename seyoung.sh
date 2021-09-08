#!/bin/bash

export USE_WEBCAM=1
scons -j$(nproc)

# runtime camera ids
export ROADCAM_ID=4
export DRIVERCAM_ID=0
# some runtime flags for manager.py
export PASSIVE=0
export NOSENSOR=1

eval "$(pyenv init --path)"
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
source /home/spark/openpilot/tools/openpilot_env.sh

./launch_openpilot.sh 2>&1 | tee run.log

# PASSIVE=0 NOSENSOR=1 USE_WEBCAM=1 ./manager.py |  2>&1 | tee run.log
