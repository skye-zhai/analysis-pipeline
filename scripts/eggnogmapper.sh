#!/bin/bash

#SBATCH --job-name=eggnog
#SBATCH --partition=small
#SBATCH -n 20
#SBATCH --ntasks-per-node=20
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate new

mkdir all_isolates_core95_identity80
emapper.py -i /lustre/home/acct-clswcc/clswcc-zyt/metagenome/clean_L.lactis/pan/all_isolates_core95_identity80/pan_genome_reference.fa --itype CDS --translate -m diamond --data_dir /lustre/home/acct-clswcc/clswcc-zyt/softwares/eggnog-mapper-data/ -o all_genomes --output_dir ./all_isolates_core95_identity80 --cpu 20 --excel
