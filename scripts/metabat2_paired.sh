#!/bin/bash

dir="/lustre/home/acct-clswcc/clswcc-zyt/metagenome/human_metagenomes/gut_PRJNA422434_11/L.lactis_samples"
cd ${dir}
mkdir metabat_scripts
mkdir metabat_output

for i in `cat accession.txt`
do
    echo "#!/bin/bash

#SBATCH --job-name=metabat2
#SBATCH --partition=small
#SBATCH -n 16
#SBATCH --ntasks-per-node=16
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate new

cd ${dir}/metabat_output
mkdir ${i}
cd ${i}
bowtie2-build -f ${dir}/spades_output/${i}/scaffolds.fasta ${i} --threads 16
bowtie2 -1 ${dir}/${i}_paired_1.fastq -2 ${dir}/${i}_paired_2.fastq -p 16 -x ${i} -S ${i}.sam

module load samtools
samtools view --threads 16 -b -S ${i}.sam -o ${i}.bam
samtools sort ${i}.bam -o ${i}.sorted.bam --threads 16

jgi_summarize_bam_contig_depths --outputDepth ${i}.depth.txt ${i}.sorted.bam
metabat2 -m 1500 -t 16 -i ${dir}/spades_output/${i}/scaffolds.fasta -a ${i}.depth.txt -o bins/${i} -v > log.txt" > ${dir}/metabat_scripts/${i}.slurm
done
