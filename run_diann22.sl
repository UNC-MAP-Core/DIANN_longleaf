#!/bin/bash

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --mem=128g
#SBATCH --cpus-per-task=50
#SBATCH --time=24:00:00
#SBATCH --mail-type=all
#SBATCH --mail-user=EMAIL@med.unc.edu

module purge
module add apptainer

cd /nas/longleaf/containers/diann/2.2.0/image

apptainer exec -B /work/users/o/n/onyen/RAW diann-2.2.0.sif /diann-2.2.0/diann-linux --cfg /nas/longleaf/home/onyen/DIANN/proj1/proj1_config.txt--
