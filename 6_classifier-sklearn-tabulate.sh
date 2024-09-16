#!/bin/sh
#SBATCH --job-name=“sklearn”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=15G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/sklearn.err-%N
#SBATCH -o errors/sklearn-tax.out-%N

# using previously trained classifier to tabulate sequences
# load/variables
module load QIIME2/2023.7
trained_classifier=/home/sb29930/art001/training-feature-classifiers/trained-classifier.qza #keep from old dir
taxonomy_assignment=/home/sb29930/qiime_artemis/data-clean/art-taxonomy-silva.qza  # an output
unknown_reads=/home/sb29930/qiime_artemis/data-clean/rep-seqs.qza 
output=/home/sb29930/qiime_artemis/analysis/

qiime feature-classifier classify-sklearn \
  --i-reads $unknown_reads \
  --i-classifier $trained_classifier \
  --p-confidence 0.7 \
  --o-classification $taxonomy_assignment
  
qiime metadata tabulate \
  --m-input-file $taxonomy_assignment \
  --o-visualization $output/taxonomy.qzv  # import into qiime2 view, download as tsv file