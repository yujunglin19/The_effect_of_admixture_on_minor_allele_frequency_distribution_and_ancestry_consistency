#!/bin/bash

DATA_DIR="02704_data"

for pop in CEU CHB CHD JPT YRI ASW GIH LWK MKK MXL TSI  # List of population prefixes
do
    # Replace placeholders in the template
    sed "s|INPUT_GENO|${DATA_DIR}/${pop}.geno|g; s|INPUT_SNP|${DATA_DIR}/${pop}.snp|g; s|INPUT_IND|${DATA_DIR}/${pop}.ind|g; s|OUTPUT_PED|${DATA_DIR}/${pop}.ped|g; s|OUTPUT_MAP|${DATA_DIR}/${pop}.map|g; s|OUTPUT_PEDIND|${DATA_DIR}/${pop}.pedind|g" \
    convertf.par > convertf_${pop}.par
    
    # Run convertf with the generated parameter file
    convertf -p convertf_${pop}.par
done
