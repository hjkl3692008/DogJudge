# /usr/bin/env sh
echo "Begin train...."

CAFEBIN=/root/caffe/build/tools/caffe
SOLVER=/root/caffe/models/bvlc_googlenet/solver.prototxt
$CAFEBIN train -solver $SOLVER


echo "Done train..."
