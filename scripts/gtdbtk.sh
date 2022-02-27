#!/bin/bash

#SBATCH --job-name=gtdbtk
#SBATCH --partition=huge
#SBATCH -n 30
#SBATCH --ntasks-per-node=30
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate gtdbtk

gtdbtk classify_wf --genome_dir ./HQ-bins/bins_tmp --out_dir ./HQ-bins/gtdbtk_taxonomy_cheese_PRJEB6952_ERR752918.4 -x fna --prefix gtdbtk --cpus 30 --debug
