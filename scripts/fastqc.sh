#!/bin/bash

#SBATCH --job-name=fastqc
#SBATCH --partition=small
#SBATCH -n 2
#SBATCH --ntasks-per-node=2
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate meta

fastqc -o ./fastqc -t 2 trimmed_ERR1653138.fastq.gz
