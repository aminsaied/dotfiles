#!/bin/bash

echo "Removing existing Conda environments..."

# make sure you are in base environment
source ~/miniconda/etc/profile.d/conda.sh
conda activate base

# loop through output of "conda env list"
for line in $(conda env list | cut --delimiter=' ' -f1)
do
    # skip commented lines
    [[ $line =~ ^"#".* ]] && continue
    
    # skip base environment
    [[ $line =~ ^"base".* ]] && continue

    # skip empty lines
    [[ $line =~ ^$ ]] && continue

    echo "Removing environment $line"
    conda remove --name $line --all -y
    echo ""
done
 
CURR_PATH="`dirname \"$0\"`"
echo "Creating conda environments from $CURR_PATH..."
# ls "$CURR_PATH" | while read line
for file in $(ls "$CURR_PATH")
do
    # skip setup-environment.sh file
    [[ $file = *.sh ]] && continue
    
    echo "Creating Conda environment from $file"
    conda env create -f $file
done