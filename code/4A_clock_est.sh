#!/bin/bash
#SBATCH --partition=compute         # Queue selection
#SBATCH --job-name=serial_job       # Job name
#SBATCH --mail-type=END             # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=email@whoi.edu  # Where to send mail
#SBATCH --ntasks=1                  # Run on a single CPU
#SBATCH --mem=15gb                   # Job memory request
#SBATCH --time=02:00:00             # Time limit hrs:min:sec
#SBATCH --output=log_atr_%j.log  # Standard output/error
 
pwd; hostname; date
 
module load anaconda3/2021.05       # load anaconda

source activate treetime
treetime ancestral \
	--tree /vortexfs1/omics/env-bio/collaboration/env_bio_covid/data/mafft_out/aligned_mafft_ncov.fasta.uniqueseq.phy \
	--aln /vortexfs1/omics/env-bio/collaboration/env_bio_covid/data/mafft_out/aligned_mafft_ncov.fasta \
	--gtr JC69 \
	--keep-overhangs \
	--outdir /vortexfs1/omics/env-bio/collaboration/env_bio_covid/results/treetime_out/

echo "finished atr" 
date

