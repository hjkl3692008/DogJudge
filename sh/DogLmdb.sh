#!/usr/bin/env bash
# /usr/bin/env sh
echo "Begin lmdb..."
ROOTFOLDER=/root/MachineLearn/Dog/sampleImg/
OUTPUT=/root/MachineLearn/Dog/sampleImg/dog_judge
CONVERT_BIN=/root/caffe/build/tools/convert_imageset

rm -rf $OUTPUT/img_train_lmdb
$CONVERT_BIN --shuffle --resize_height=256 --resize_width=256 $ROOTFOLDER $OUTPUT/train_split.txt  $OUTPUT/img_train_lmdb

rm -rf $OUTPUT/img_val_lmdb
$CONVERT_BIN --shuffle --resize_height=256 --resize_width=256 $ROOTFOLDER $OUTPUT/val_split.txt  $OUTPUT/img_val_lmdb
echo "Done lmdb..."


