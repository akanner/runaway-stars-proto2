#!/bin/bash

touch $2

ARE_CORRECT=$3;
#scans a folder for .jpg files and creates a list of SQL inserts for the table "image"
JPG_FILES=$(ls $1| grep "[.]jpg$");

for FILE in $JPG_FILES; do
	INSERT="INSERT INTO \`raway_db_dev\`.\`image\`(\`file_path\`,\`is_correct\`,\`marked_bowshock_image\`)VALUES(\"${FILE}\",${ARE_CORRECT},NULL);"

	echo $INSERT >> $2

done