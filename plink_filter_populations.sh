#!/bin/bash

# parameters
GENO_THRESHOLD=0.05  # SNP missing rate threshold
MIND_THRESHOLD=0.05  # Individual missing rate threshold
LD_WINDOW_SIZE=10    # Window size for LD pruning
LD_STEP_SIZE=5       # Step size for LD pruning
LD_R2_THRESHOLD=0.8  # LD threshold for pruning

DATA_DIR="02704_data"
OUTPUT_DIR="02704_data/dis_prune/filtered_08"

for pop in CEU CHB CHD JPT YRI ASW GIH LWK MKK MXL TSI  # List of population prefixes
do
	# remove snps with high missing rate
	plink --bfile "$DATA_DIR/${pop}_binary" \
	      --geno "$GENO_THRESHOLD" \
	      --make-bed \
	      --out "$OUTPUT_DIR/${pop}_geno_filtered"
	# remove ind with high missing rate
        plink --bfile "$OUTPUT_DIR/${pop}_geno_filtered" \
              --mind "$MIND_THRESHOLD" \
              --make-bed \
              --out "$OUTPUT_DIR/${pop}_mind_filtered"
	# LD pruning
	plink --bfile "$OUTPUT_DIR/${pop}_mind_filtered" \
              --indep-pairwise "$LD_WINDOW_SIZE" "$LD_STEP_SIZE" "$LD_R2_THRESHOLD" \
              --out "$OUTPUT_DIR/${pop}_prune"

	plink --bfile "$OUTPUT_DIR/${pop}_mind_filtered" \
              --extract "$OUTPUT_DIR/${pop}_prune.prune.in" \
              --make-bed \
              --out "$OUTPUT_DIR/${pop}_final"
done
