#!/bin/bash

IS_CORRECT=$2;
BAND=$3;
OUTPUT=$4;

touch $OUTPUT;
while read STAR_NAME; do
	RGB="${STAR_NAME}-rgb.jpg"
	COOL="${STAR_NAME}-${BAND}-Cool-pow-99.5.jpg"  #HIP52849-w3-Cool-pow-99.5.jpg
	HEAT="${STAR_NAME}-${BAND}-Heat-pow-99.5.jpg"  #HIP52849-w3-Heat-pow-99.5.jpg
	HSV="${STAR_NAME}-${BAND}-Hsv-pow-99.5.jpg"  #HIP52849-w3-Hsv-pow-99.5.jpg

	SQL_STATEMENT="INSERT INTO \`raway_db\`.\`image\`(\`rgb_image_path\`,\`is_correct\`,\`marked_bowshock_image\`,\`cool_image_path\`,\`heat_image_path\`,\`hsv_image_path\`)VALUES(\"${RGB}\",\"${IS_CORRECT}\",NULL,\"${COOL}\",\"${HEAT}\",\"${HSV}\");";
	echo $SQL_STATEMENT >> $OUTPUT
done < $1