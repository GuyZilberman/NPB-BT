#!/bin/bash

# Set the default class to A
CLASS=${1:-A}

# Accept OMP_NUM_THREADS from the second parameter or default 
OMP_NUM_THREADS=${2:-32}

export OMP_TARGET_OFFLOAD=MANDATORY

export LIBOMPTARGET_PLUGIN_PROFILE=2

export IGC_ForceOCLSIMDWidth=16
unset IGC_ForceOCLSIMDWidth

# unset LIBOMPTARGET_LEVEL_ZERO_COMMAND_BATCH

export LIBOMPTARGET_LEVEL_ZERO_USE_IMMEDIATE_COMMAND_LIST=1
unset LIBOMPTARGET_LEVEL_ZERO_USE_IMMEDIATE_COMMAND_LIST

export CFESingleSliceDispatchCCSMode=1
unset CFESingleSliceDispatchCCSMode

export LIBOMPTARGET_DEVICES=DEVICE
unset LIBOMPTARGET_DEVICES


export OMP_NUM_THREADS
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo -e "Using OMP_NUM_THREADS = ${OMP_NUM_THREADS}"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"

make bt CLASS=$CLASS
./bin/bt.$CLASS
# echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# ./bin/bt.$CLASS
# echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# ./bin/bt.$CLASS
# echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# ./bin/bt.$CLASS
# echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
# ./bin/bt.$CLASS
# echo "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"

echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
echo -e "Using OMP_NUM_THREADS = ${OMP_NUM_THREADS}"
echo "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%"
