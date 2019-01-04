#!/usr/bin/env bash
# /usr/bin/env sh
echo "Begin mean..."

LMDB=/root/MachineLearn/Dog/sampleImg/dog_judge/img_train_lmdb
MEAN_BIN=/root/caffe/build/tools/compute_image_mean
OUTPUT=/root/MachineLearn/Dog/sampleImg/dog_judge/mean.binaryproto

echo $OUTPUT

$MEAN_BIN $LMDB $OUTPUT

LMDB=/root/MachineLearn/Dog/sampleImg/dog_judge/img_val_lmdb
OUTPUT=/root/MachineLearn/Dog/sampleImg/dog_judge/mean_val.binaryproto
echo $OUTPUT
$MEAN_BIN $LMDB $OUTPUT

echo "Done mean..."
