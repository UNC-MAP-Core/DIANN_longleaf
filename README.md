# Running DIA-NN on LongLeaf (HPC) at UNC

This repository is for running DIA proteomics data on the longleaf HPC at UNC. If you are not a UNC member, I'm sure the scripts can be used with minor changes on your own HPC.

[DIA-NN](https://github.com/vdemichev/DiaNN) is a free (for academics) software to process data-independent acquisition proteomics data. Searching DIA raw data can require a powerful processing computer, which is why I've had DIA-NN setup on our local HPC. To use it, I have added a slurm job script and a configuration file that contains basic DIA-NN settings that will have to be updated for each experiment.

Unlike in previous Linux versions of DIA-NN, in the latest version (2.2), Thermo RAW files do **not** need to be converted into the mzML format.


Here are some helpful links to help you get started using the longleaf cluster at UNC:

* [UNC Research Computing](https://help.rc.unc.edu/)
* [Getting started on longleaf](https://help.rc.unc.edu/getting-started-on-longleaf#applications-environment)
* [Module Software Management](https://help.rc.unc.edu/modules/)
* [Longleaf Cluster SLURM Jobs](https://help.rc.unc.edu/longleaf-slurm-examples/)
* [Data Storage](https://help.rc.unc.edu/storage)


## Setup

First, the user needs to have a longleaf account at UNC. Please reach out to IT to set that up.


Before going further, I strongly recommend reading over the DIA-NN GitHub page linked above. There is a section on "Command-Line reference" where all the commands are listed that you can use in the config file.


* Transfer RAW files to the /work storage, where your limit is 10TB.
* Create a DIANN directory in your home folder (/onyen/diann). In that directory, create a unique directory for each project, and an additional one for all your fasta files. I've included several FASTA files in this repository for convenience. 
* Make adjustments to the config file in this repo. The most important changes are the location of the raw files (-f), and the fasta files (-fasta). By default, I have Carbamidomethyl as a fix modification, and oxidized Methionine and N-terminal acetylation set as variable modifications. Go to UniMod.org to find the relevant information for other modifications.
* Next, open the slurm file (run_diann22.sl). It gives DIANN access to your /work directory, starts running DIANN, and gives it your configuration file. The things you need to update are the following: your email address after "--mail-user", which will email you when your slurm job starts, finishes, or fails. Update the directories on the last line, change /work/users/o/n/onyen/RAW to the directory with your raw files. Update the location of your config file (/home/onyen/DIANN/proj1/proj1_config.txt--).
* Transfer the config file to the project-specific directory (ex. onyen/diann/proj1/proj1_config.txt), and transfer the slurm file (run\_diann22.sl) to the diann directory.
* To run it, make sure you're in the diann directory and run "sbatch run\_diann22.sl", without the quotes.


If you have any questions, please reach out to me, scott_lyons@med.unc.edu


