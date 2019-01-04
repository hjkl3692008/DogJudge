# /usr/bin/env sh
DATA=/root/MachineLearn/Dog/sampleImg

HASHIQI=${DATA}/哈士奇
LALA=${DATA}/拉布拉多
BM=${DATA}/博美
CQ=${DATA}/柴犬
DM=${DATA}/德国牧羊犬
DB=${DATA}/杜宾
BG=${DATA}/巴哥
BIG=${DATA}/比格
JM=${DATA}/金毛
KJ=${DATA}/柯基
NTG=${DATA}/牛头梗
SMY=${DATA}/萨摩耶
TD=${DATA}/泰迪犬
BJ=${DATA}/边境牧羊犬

OUTPUT=/root/MachineLearn/Dog/sampleImg/dog_judge
mkdir $OUTPUT

echo "Create data.txt..."
rm -rf $OUTPUT/data.txt

find $HASHIQI -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 1/">>$OUTPUT/data.txt
find $LALA -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 2/">>$OUTPUT/lala.txt
find $BM -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 3/">>$OUTPUT/bm.txt
find $CQ -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 4/">>$OUTPUT/cq.txt
find $DM -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 5/">>$OUTPUT/dm.txt
find $DB -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 6/">>$OUTPUT/db.txt
find $BG -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 2/">>$OUTPUT/bg.txt
find $BIG -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 3/">>$OUTPUT/big.txt
find $JM -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 4/">>$OUTPUT/jm.txt
find $KJ -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 5/">>$OUTPUT/kj.txt
find $NTG -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 6/">>$OUTPUT/ntg.txt
find $SMY -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 2/">>$OUTPUT/smy.txt
find $TD -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 3/">>$OUTPUT/td.txt
find $BJ -name *.jpeg | cut -d '/' -f 6,7 | sed "s/$/ 4/">>$OUTPUT/bj.txt

cat $OUTPUT/lala.txt>>$OUTPUT/data.txt
cat $OUTPUT/bm.txt>>$OUTPUT/data.txt
cat $OUTPUT/cq.txt>>$OUTPUT/data.txt
cat $OUTPUT/dm.txt>>$OUTPUT/data.txt
cat $OUTPUT/db.txt>>$OUTPUT/data.txt
cat $OUTPUT/bg.txt>>$OUTPUT/data.txt
cat $OUTPUT/big.txt>>$OUTPUT/data.txt
cat $OUTPUT/jm.txt>>$OUTPUT/data.txt
cat $OUTPUT/kj.txt>>$OUTPUT/data.txt
cat $OUTPUT/ntg.txt>>$OUTPUT/data.txt
cat $OUTPUT/smy.txt>>$OUTPUT/data.txt
cat $OUTPUT/td.txt>>$OUTPUT/data.txt
cat $OUTPUT/bj.txt>>$OUTPUT/data.txt


rm -rf $OUTPUT/lala.txt
rm -rf $OUTPUT/bm.txt
rm -rf $OUTPUT/cq.txt
rm -rf $OUTPUT/dm.txt
rm -rf $OUTPUT/db.txt
rm -rf $OUTPUT/bg.txt
rm -rf $OUTPUT/big.txt
rm -rf $OUTPUT/jm.txt
rm -rf $OUTPUT/kj.txt
rm -rf $OUTPUT/ntg.txt
rm -rf $OUTPUT/smy.txt
rm -rf $OUTPUT/td.txt
rm -rf $OUTPUT/bj.txt

echo "data.txt Done.."
