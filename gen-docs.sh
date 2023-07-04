#!/usr/bin/env sh
# -----------------------------------------------------------------------------
#  Generate Terraform DOcs
# -----------------------------------------------------------------------------
#  Author     : Dwi Fahni Denni
#  License    : Apache v2
# -----------------------------------------------------------------------------
set -e

CURRENT_PATH=`pwd`
# LIST_FOLDERS=`ls -d -R -- */ | cut -f1 -d'/'`
LIST_FOLDERS=`find module* -type d`

for FOLDER in $LIST_FOLDERS; do
  echo "------------------------------------------------------"
  echo " Create Docs: $CURRENT_PATH/$FOLDER"
  echo "------------------------------------------------------"
  echo "> terraform-docs markdown table --output-file README.md . "
  cd $CURRENT_PATH/$FOLDER
  terraform-docs markdown table --output-file README.md .
  echo "- DONE -"
done

echo ""
echo "- ALL DONE -"