#! /bin/bash
dir="/lustre/home/acct-clswcc/clswcc-zyt/metagenome/clean_L.lactis/food_MAGs"
cd ${dir}
mkdir prokka_scripts
mkdir prokka_output
for i in *.fna
do
    echo "#!/bin/bash

#SBATCH --job-name=prokka
#SBATCH --partition=small
#SBATCH -n 8
#SBATCH --ntasks-per-node=8
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate roary

cd prokka_output
prokka --kingdom Bacteria --prefix ${i%.fna} --outdir ${i%.fna} --locustag ${i%.fna} ${dir}/${i}" > ./prokka_scripts/${i%.fna}.slurm
done
