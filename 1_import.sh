#!/bin/sh
#SBATCH --job-name=“import-data”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=15G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/import-data.err-%N
#SBATCH -o errors/import-data.out-%N

# import data
module load QIIME2/2023.7
input=/home/sb29930/art001/data-raw/fastq
output=/home/sb29930/art001/data-clean/ART001-demultiplexed-samples.qza

qiime tools import \
  --type MultiplexedPairedEndBarcodeInSequence \
  --input-path $input \
  --output-path $output
