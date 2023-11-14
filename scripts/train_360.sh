#!/bin/bash
# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

export CUDA_VISIBLE_DEVICES='6,7'

# for real captured part
# SCENE=dexter_gameroom_20231021_gaochen
#SCENE=dexter_hi_everyone_20231021_gaochen
#SCENE=yipengwang_Block20-I-GOT-UBNED
SCENE=yipengwang_dexter-montlake-bridge
EXPERIMENT=logs_Mip-NeRF-360
DATA_DIR=/home/yipengwang/dataset/msnerf/"$SCENE"
CHECKPOINT_DIR=/home/yipengwang/experiment/mipnerf/"$EXPERIMENT"/"$SCENE"

# If running one of the indoor scenes, add
# --gin_bindings="Config.factor = 2"

rm "$CHECKPOINT_DIR"/*
python -m train \
  --gin_configs=configs/360.gin \
  --gin_bindings="Config.factor = -1" \
  --gin_bindings="Config.data_dir = '${DATA_DIR}'" \
  --gin_bindings="Config.checkpoint_dir = '${CHECKPOINT_DIR}'" \
  --logtostderr
