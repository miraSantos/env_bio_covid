#!/bin/bash
#SBATCH --partition=compute         # Queue selection
#SBATCH --job-name=serial_job       # Job name
#SBATCH --mail-type=END             # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=email@whoi.edu  # Where to send mail
#SBATCH --ntasks=1                  # Run on a single CPU
#SBATCH --mem=15gb                   # Job memory request
#SBATCH --time=02:00:00             # Time limit hrs:min:sec
#SBATCH --output=log_mafft_%j.log  # Standard output/error
 
pwd; hostname; date
 
module load anaconda3/2021.05       # Load the python module

source activate mafft

mafft \
	--auto \
	--thread 9 \
	 --keeplength \
	 --addfragments \
	 /vortexfs1/omics/env-bio/collaboration/env_bio_covid/data/nyc/gisaid_nyc_sequences.fasta \
	 /vortexfs1/omics/env-bio/collaboration/env_bio_covid/data/reference_genomes/wuhan_hu_1/wuhan_reference.sequences.fasta > /vortexfs1/omics/env-bio/collaboration/env_bio_covid/data/mafft_out/aligned_mafft_ncov.fasta 2> /vortexfs1/omics/env-bio/collaboration/env_bio_covid/code/logs_mafft/align_mafft_ncov.txt

echo "finished mafft"
 
date
