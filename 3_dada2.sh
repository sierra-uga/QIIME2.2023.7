#!/bin/sh
#SBATCH --job-name=“dada2-analysis”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=200G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/dada2.err-%N
#SBATCH -o errors/dada2.out-%N

# load/variables
module load QIIME2/2023.7
input=/home/sb29930/qiime_artemis/data-clean
output=/home/sb29930/qiime_artemis/data-clean

qiime dada2 denoise-paired \
        --i-demultiplexed-seqs $input/art-demultiplexed.qza \
        --p-n-threads 0 \
        --p-trunc-len-f 194 \
        --p-trunc-len-r 244 \
        --p-chimera-method pooled \
        --verbose \
        --o-table $output/table-dada2.qza \
        --o-representative-sequences $output/rep-seqs-dada2.qza \
        --o-denoising-stats $output/stats-dada2.qza


