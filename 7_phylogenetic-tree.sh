#!/bin/sh
#SBATCH --job-name=“phylogenetic-tree”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=5G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/phylo.err-%N
#SBATCH -o errors/phylo.out-%N

# load/variables
module load QIIME2/2023.7
input=/home/sb29930/qiime_artemis/data-clean/rep-seqs.qza
output=/home/sb29930/qiime_artemis/data-clean/

qiime phylogeny align-to-tree-mafft-fasttree \
  --i-sequences $input \
  --o-alignment $output/aligned-rep-seqs.qza \
  --o-masked-alignment $output/masked-aligned-rep-seqs.qza \
  --o-tree $output/unrooted-tree.qza \
  --o-rooted-tree $output/rooted-tree.qza 
  
  #tree file