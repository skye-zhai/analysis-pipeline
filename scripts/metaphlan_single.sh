#!/bin/bash

dir="/lustre/home/acct-clswcc/clswcc-zyt/metagenome/human_metagenomes/gut_SGB_27/single/L.lactis_samples"
cd ${dir}
mkdir metaphlan_scripts
mkdir metaphlan_output
for i in `cat accession.txt`
do
echo "#!/bin/bash

#SBATCH --job-name=metaphlan
#SBATCH --partition=small
#SBATCH -n 16
#SBATCH --ntasks-per-node=16
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate phylophlan

metaphlan ${dir}/${i}.fastq --no_map --input_type fastq --ignore_eukaryotes --nproc 16 --bowtie2db /lustre/home/acct-clswcc/clswcc-zyt/metagenome/lac/strainphlan/metaphlan_db -o ${dir}/metaphlan_output/${i}_profile.txt" > ./metaphlan_scripts/${i}.slurm
done
