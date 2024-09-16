#!/bin/sh
#SBATCH --job-name=“tabulate_rename”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=20G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/dada2.err-%N
#SBATCH -o errors/dada2.out-%N

# load/variables
module load QIIME2/2023.7
input=/home/sb29930/qiime_artemis/data-clean
output=/home/sb29930/qiime_artemis/data-clean

qiime metadata tabulate \
  --m-input-file $input/stats-dada2.qza \
  --o-visualization $output/stats-dada2.qzv

mv rep-seqs-dada2.qza rep-seqs.qza
mv table-dada2.qza table.qza