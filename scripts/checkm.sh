#!/bin/bash

dir="/lustre/home/acct-clswcc/clswcc-zyt/metagenome/human_metagenomes/gut_SGB_27/single/L.lactis_samples"
cd ${dir}
mkdir checkm_scripts

for line in `cat ./accession.txt`
do
    echo "#!/bin/bash

#SBATCH --job-name=checkm
#SBATCH --partition=small
#SBATCH -n 10
#SBATCH --ntasks-per-node=10
#SBATCH --output=%j.out
#SBATCH --error=%j.err
#SBATCH --mail-type=end
#SBATCH --mail-user=zhaiyiting@sjtu.edu.cn

module load miniconda3
source activate new

checkm lineage_wf -t 10 -x fa --nt --tab_table -f ${dir}/metabat_output/${line}/bins/checkm_result.txt ${dir}/metabat_output/${line}/bins/ ${dir}/metabat_output/${line}/bins/checkm_result" > ./checkm_scripts/${line}.slurm
done

