#!/bin/bash

# Define directory containing the PLINK files for each population
DATA_DIR="../02704_data/plink_output/filtered_08"
OUTPUT_DIR="./results"
K_MIN=2
K_MAX=4

for POP in ASW CEU CHB CHD GIH JPT LWK MEX TSI YRI MKK; do
  for K in $(seq $K_MIN $K_MAX); do
        echo "Running Admixture for $POP with K=$K..."
        ./admixture32 --cv "${DATA_DIR}/${POP}_final.bed" $K | tee "${OUTPUT_DIR}/${POP}_K${K}.log"
    done
done

