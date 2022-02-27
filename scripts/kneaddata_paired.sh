#!/bin/bash

#SBATCH --job-name=kneaddata
#SBATCH --partition=small
#SBATCH -n 10
#SBATCH --ntasks-per-node=10
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate meta

dir="/lustre/home/acct-clswcc/clswcc-zyt/metagenome/food/cheese_PRJEB6314_5"
cd $dir
mkdir kneaddata_output
for i in `cat accession.txt`
do
kneaddata --input ${i}_1.fastq.gz --input ${i}_2.fastq.gz --reference-db /lustre/home/acct-clswcc/clswcc-zyt/softwares/kneaddata_database/ --output kneaddata_output --output-prefix ${i} --run-trim-repetitive --trimmomatic-options="LEADING:3" --trimmomatic-options="TRAILING:3" --trimmomatic-options="MINLEN:50" --trimmomatic-options="SLIDINGWINDOW:4:20" --trimmomatic-options="HEADCROP:10" --trimmomatic-options="ILLUMINACLIP:/lustre/home/acct-clswcc/clswcc-zyt/softwares/Trimmomatic-0.39/adapters/NexteraPE-PE.fa:2:30:10" --run-fastqc-start --run-fastqc-end -t 10 --trimmomatic /lustre/home/acct-clswcc/clswcc-zyt/softwares/Trimmomatic-0.39 --fastqc ~/.conda/envs/meta/bin/ --remove-intermediate-output
done
