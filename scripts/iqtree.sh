#!/bin/bash

#SBATCH --job-name=iqtree
#SBATCH --partition=small
#SBATCH -n 20
#SBATCH --ntasks-per-node=20
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate hard

iqtree -s /lustre/home/acct-clswcc/clswcc-zyt/metagenome/clean_L.lactis/pan/dereplicated_genomes998_core95_identity80/core_gene_alignment.aln -m MFP -T 20 -B 1000 --bnni
