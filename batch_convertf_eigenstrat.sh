#!/bin/bash

DATA_DIR="../02704_data/plink_output/filtered_08"
OUTPUT_DIR="../02704_data/plink_output/filtered_08"

for pop in CEU CHB CHD JPT YRI ASW GIH LWK MKK MXL TSI  # List of population prefixes
do
    # Replace placeholders in the template
    sed "s|INPUT_BED|${DATA_DIR}/${pop}_final.bed|g; s|INPUT_BIM|${DATA_DIR}/${pop}_final.bim|g; s|INPUT_FAM|${DATA_DIR}/${pop}_final.fam|g; s|OUTPUT_GENO|${OUTPUT_DIR}/${pop}_final.geno|g; s|OUTPUT_SNP|${OUTPUT_DIR}/${pop}_final.snp|g; s|OUTPUT_IND|${OUTPUT_DIR}/${pop}_final.ind|g" convertf_eigenstrat.par > convertf_${pop}_eigenstrat.par

    # Run convertf with the generated parameter file
    convertf -p convertf_${pop}_eigenstrat.par
done
