#!/bin/sh
#SBATCH --job-name=“classifier-training”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=15G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e training.err-%N
#SBATCH -o training.out-%N

# load/variables
module load QIIME2/2023.7
SILVA_taxonomy=/home/sb29930/art001/SILVA/qiime_Silva_tax.qza
reference_sequences=/home/sb29930/art001/training-feature-classifiers/extract-ref-seqs.qza
trained_classifier=/home/sb29930/art001/training-feature-classifiers/trained-classifier.qza

# train naive bayes using your trimmed SILVA. Use default parameters 
qiime feature-classifier fit-classifier-naive-bayes \ 
  --i-reference-reads $reference_sequences \
  --i-reference-taxonomy $SILVA_taxonomy \
  --o-classifier $trained_classifier

