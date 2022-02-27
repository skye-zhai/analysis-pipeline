#!/bin/bash

#SBATCH --job-name=ani
#SBATCH --partition=small
#SBATCH -n 20
#SBATCH --ntasks-per-node=20
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate python

fastANI --ql lactis.txt --rl lactis.txt -o output.txt --fragLen 1000 -t 20 --matrix
