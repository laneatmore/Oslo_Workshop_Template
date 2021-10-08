#!/bin/bash
#SBATCH --account=nn9244k
#SBATCH --time=120:00:00
#SBATCH --job-name=score_bams_iteration
#SBATCH --cpus-per-task=1
#SBATCH --mem-per-cpu=20G

#set -o errexit


module --quiet purge
module load VCFtools/0.1.16-intel-2018b-Perl-5.28.0
module load SAMtools/1.9-intel-2018b
module load Anaconda3/2019.03

export PS1=\$

source ${EBROOTANACONDA3}/etc/profile.d/conda.sh

conda deactivate &>/dev/null
conda activate /cluster/projects/nn9244k/python3

###$1 is VCF
###$2 is OUT
###$3 is CUT_OFF
###$4 is BAM dir
###$5 is IND

mkdir $SCRATCH/BAMS

##Copy all BAMfiles to scratch

for f in $(ls ${4}/*)

do 

rsync -Lav $f $SCRATCH/BAMS

done

rsync -Lav $1 $SCRATCH


VCF=$1
OUT=$2_$3

#ABS=$4

rsync -Lav $2* $SCRATCH

echo "List SCRATCH directory..."
ls $SCRATCH

echo "List BAM directory..."
ls $SCRATCH/BAMS

cd $SCRATCH

python /cluster/projects/nn9987k/Seachanges/BAMscorer_v1_linux score_bams $VCF $OUT BAMS --wg

mkdir -p $SUBMITDIR/OUTPUT_$2

cp $2_$3_scores.txt $SUBMITDIR/OUTPUT_$2/$5_$2_$3_scores.txt
