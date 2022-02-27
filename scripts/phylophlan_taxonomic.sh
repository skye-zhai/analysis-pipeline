#!/bin/bash

#SBATCH --job-name=phylophlan
#SBATCH --partition=huge
#SBATCH -n 30
#SBATCH --ntasks-per-node=30
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate phylophlan

phylophlan_metagenomic -i ./HQ-bins/ -e .fna -o phylophlan_output --nproc 30 -n 1 -d SGB.Jul20
