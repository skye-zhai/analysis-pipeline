#!/bin/bash

#SBATCH --job-name=trimmomatic
#SBATCH --partition=small
#SBATCH -n 4
#SBATCH --ntasks-per-node=4
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate meta

java -jar /lustre/home/acct-clswcc/clswcc-zyt/softwares/Trimmomatic-0.39/trimmomatic-0.39.jar SE -phred33 kefir_PRJEB15432_18/ERR1653138.fastq.gz ./trimmed_ERR1653138.fastq.gz ILLUMINACLIP:/lustre/home/acct-clswcc/clswcc-zyt/softwares/Trimmomatic-0.39/adapters/NexteraPE-PE.fa:2:30:10 LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36 -threads 4
