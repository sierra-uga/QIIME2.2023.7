#!/bin/sh
#SBATCH --job-name=“extract-reads”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=15G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e xtract.err-%N
#SBATCH -o xtract.out-%N

# load/variables
module load QIIME2/2023.7
SILVA_taxonomy_seq=/home/sb29930/art001/SILVA/qiime_Silva_seq.qza
reference_sequences=/home/sb29930/art001/training-feature-classifiers/extract-ref-seqs.qza

qiime feature-classifier extract-reads \
  --i-sequences $SILVA_taxonomy_seq \
  --p-f-primer GTGYCAGCMGCCGCGGTAA \
  --p-r-primer GGACTACNVGGGTWTCTAAT \
  --p-min-length 100 \ 
  --p-max-length 400 \ 
  --o-reads $reference_sequences
  
