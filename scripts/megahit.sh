#!/bin/bash

#paird-end
megahit -1 /lustre/home/acct-clswcc/clswcc-zyt/metagenome/human_metagenomes/gut_PRJNA422434_11/L.lactis_samples/gut_PRJNA422434_SRR1778451_paired_1.fastq -2 /lustre/home/acct-clswcc/clswcc-zyt/metagenome/human_metagenomes/gut_PRJNA422434_11/L.lactis_samples/gut_PRJNA422434_SRR1778451_paired_2.fastq -o spades_output/gut_PRJNA422434_SRR1778451_megahit --out-prefix scaffolds -t 10

#single-end
#megahit -r ${dir}/${i}.fastq -o ${dir}/spades_output/${i} --out-prefix scaffolds -t 16" > ./spades_scripts/${i}.slurm
