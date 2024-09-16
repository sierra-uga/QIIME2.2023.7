#!/bin/sh
#SBATCH --job-name=“addnt-demux”
#SBATCH --partition=batch
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=4
#SBATCH --mem-per-cpu=100G
#SBATCH --time=7-00:00:00
#SBATCH --mail-user=sb29930@uga.edu
#SBATCH --mail-type=END,FAIL
#SBATCH -e errors/demux-data.err-%N
#SBATCH -o errors/demux-data.out-%N

# demultiplex samples
# load/variables
module load QIIME2/2023.7
input=/home/sb29930/art001/data-clean/ART001-demultiplexed-samples.qza
metad=/home/sb29930/qiime_artemis/analysis/artemis-eDNA-metadata-final.tsv
output=/home/sb29930/qiime_artemis/data-clean

qiime cutadapt demux-paired \
    --i-seqs $input \
    --m-forward-barcodes-file $metad \
    --m-forward-barcodes-column BarcodeSequence \
    --m-reverse-barcodes-file $metad \
    --m-reverse-barcodes-column ReverseBarcode \
    --o-per-sample-sequences $output/art-demultiplexed.qza \
    --o-untrimmed-sequences $output/art-demux-untrimmed-seq.qza

qiime demux summarize \
  --i-data $output/art-demultiplexed.qza \
  --o-visualization $output/updated-demux.qzv
  