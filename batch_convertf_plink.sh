#!/bin/bash

DATA_DIR="02704_data"

for pop in CEU CHB CHD JPT YRI ASW GIH LWK MKK MXL TSI
do
    plink --file ${DATA_DIR}/${pop} --make-bed --out ${DATA_DIR}/${pop}_binary
done
