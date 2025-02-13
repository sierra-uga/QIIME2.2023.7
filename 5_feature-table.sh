#!/bin/sh
#SBATCH --job-name=“feature-table”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=5G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/feature.err-%N
#SBATCH -o errors/feature.out-%N

# for visualization of the rep-seqs and asv table
# load/variables
module load QIIME2/2023.7
input=/home/sb29930/qiime_artemis/data-clean
metad=/home/sb29930/qiime_artemis/analysis/artemis-eDNA-metadata-final.tsv
output=/home/sb29930/qiime_artemis/data-clean

qiime feature-table summarize \
  --i-table $input/table.qza \
  --o-visualization $output/asv_table.qzv
  --m-sample-metadata-file $metad
  
qiime feature-table tabulate-seqs \
  --i-data $input/rep-seqs.qza \
  --o-visualization $output/rep-seqs.qzv
