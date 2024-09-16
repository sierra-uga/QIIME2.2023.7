#!/bin/sh
#SBATCH --job-name=“alpha-sig”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=10G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/alpha.err-%N
#SBATCH -o errors/alpha.out-%N

# load/variables
module load QIIME2/2023.7
input=/home/sb29930/art001/analysis/core-metrics-results
metad=/home/sb29930/art001/analysis/artemis-eDNA-metadata-rerun.tsv
output=/home/sb29930/art001/analysis/core-metrics-results

qiime diversity alpha-group-significance \
  --i-alpha-diversity $input/faith_pd_vector.qza \
  --m-metadata-file $metad \
  --o-visualization $output/faith-pd-group-significance.qzv

qiime diversity alpha-group-significance \
  --i-alpha-diversity $input/evenness_vector.qza \
  --m-metadata-file $metad \
  --o-visualization $output/evenness-group-significance.qzv