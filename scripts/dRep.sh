#!/bin/bash

#SBATCH --job-name=drep
#SBATCH --partition=small
#SBATCH -n 20
#SBATCH --ntasks-per-node=20
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate drep

genome=`cat /lustre/home/acct-clswcc/clswcc-zyt/metagenome/clean_L.lactis/dRep/allgenomes_path.txt`
dRep dereplicate dereplicateid_genomes999 -g ${genome} --S_algorithm ANImf --clusterAlg average -pa 0.95 -sa 0.999 -nc 0.50 -cm larger -p 20 --debug
