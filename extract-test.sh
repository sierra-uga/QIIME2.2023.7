#!/bin/sh
#SBATCH --job-name=“xtract-test”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=5G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e xtract-test.err-%N
#SBATCH -o xtract-test.out-%N

# load/variables
module load QIIME2/2023.7
reference_sequences=/home/sb29930/art001/training-feature-classifiers/extract-ref-seqs.qza
output=/home/sb29930/art001/analysis

qiime tools export \
  --input-path $reference_sequences \
  --output-path $output/exported-extracted-reads