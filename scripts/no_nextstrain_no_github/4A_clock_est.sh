#!/bin/bash
#SBATCH --partition=compute         # Queue selection
#SBATCH --job-name=serial_job       # Job name
#SBATCH --mail-type=END             # Mail events (BEGIN, END, FAIL, ALL)
#SBATCH --mail-user=email@whoi.edu  # Where to send mail
#SBATCH --ntasks=1                  # Run on a single CPU
#SBATCH --mem=15gb                   # Job memory request
#SBATCH --time=02:00:00             # Time limit hrs:min:sec
#SBATCH --output=log_clock_%j.log  # Standard output/error
 
pwd; hostname; date
 
module load anaconda3/2021.05       # load anaconda

source activate treetime




echo "finished clock lengths" 

date

