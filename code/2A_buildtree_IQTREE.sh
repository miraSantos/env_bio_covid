#!/bin/bash
#SBATCH --partition=compute         # Queue selection
#SBATCH --job-name=serial_job       # Job name
#SBATCH --mail-type=END             # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=email@whoi.edu  # Where to send mail
#SBATCH --ntasks=1                  # Run on a single CPU
#SBATCH --mem=40gb                   # Job memory request
#SBATCH --time=04:00:00             # Time limit hrs:min:sec
#SBATCH --output=log_iqtree_%j.log  # Standard output/error
 
pwd; hostname; date
 
module load anaconda3/2021.05       # Load the python module

source activate mafft

iqtree \
	-s /vortexfs1/omics/env-bio/collaboration/env_bio_covid/data/mafft_iqtree_out/aligned_mafft_ncov.fasta \
	-m GTR \
	-T AUTO \
	-fast \
	-n 2 \
	-ninit 2 \
	-me 0.05 \
	-alninfo \
	-pre builttree \
	> /vortexfs1/omics/env-bio/collaboration/env_bio_covid/results/iqtree_out/log-iqtree.log 
echo "finished iqtree building" 
date
