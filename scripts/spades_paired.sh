#!/bin/bash

dir="/lustre/home/acct-clswcc/clswcc-zyt/metagenome/human_metagenomes/gut_PRJNA422434_11/L.lactis_samples"
cd ${dir}
mkdir spades_scripts
mkdir spades_output
for i in `cat accession.txt`
do
echo "#!/bin/bash

#SBATCH --job-name=spades
#SBATCH --partition=small
#SBATCH -n 18
#SBATCH --ntasks-per-node=18
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

metaspades.py -o ${dir}/spades_output/${i}/ -1 ${dir}/${i}_paired_1.fastq -2 ${dir}/${i}_paired_2.fastq -t 18" > ${dir}/spades_scripts/${i}.slurm
done
