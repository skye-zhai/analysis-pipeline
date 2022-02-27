#!/bin/bash

#SBATCH --job-name=roary
#SBATCH --partition=small
#SBATCH -n 20
#SBATCH --ntasks-per-node=20
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate newroary

roary -p 20 -i 80 -cd 95 --qc -r -f /lustre/home/acct-clswcc/clswcc-zyt/metagenome/clean_L.lactis/pan/dereplicated_genomes998_core95_identity80 -e -n -s /lustre/home/acct-clswcc/clswcc-zyt/metagenome/clean_L.lactis/dRep/dereplicated_genomes998/gff/*gff

