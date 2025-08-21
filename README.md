\# Running DIA-NN on LongLeaf (HPC) at UNC



This repository is for running DIA proteomics data on the longleaf HPC at UNC. If you are not a UNC member, I'm sure the scripts can be used with minor changes on your own HPC.

!\[DIA-NN](https://github.com/vdemichev/DiaNN) is a free (for academics) software to process data-independent acquisition proteomics data. Searching DIA raw data can require a powerful processing computer, which is why I've had DIA-NN setup on our local HPC. To use it, I have added a slurm job script and a configuration file that contains basic DIA-NN settings that will have to be changed for each experiment.



First, the user needs to have a longleaf account at UNC. Please reach out to IT to set that up.

Here are links to helpful information:

* !\[UNC Research Computing](https://help.rc.unc.edu/)
* !\[Getting started on longleaf](https://help.rc.unc.edu/getting-started-on-longleaf#applications-environment)
* !\[Module Software Management](https://help.rc.unc.edu/modules/)
* !\[Longleaf Cluster SLURM Jobs](https://help.rc.unc.edu/longleaf-slurm-examples/)
* !\[Data Storage](https://help.rc.unc.edu/storage)
* It would also be very helpful to familiarize yourself with basic Unix commands, such as cd, ls, and cat.





The latest version of DIA-NN that has been installed on longleaf is 2.2. This version no longer requires the conversion of RAW files to mzML. 



Before going further, I strongly recommend reading over the DIA-NN GitHub page linked above. There is a section on "Command-Line reference" where all the commands are listed that you can use in the config file.



To begin, you will need to transfer your files to the NAS storage. 

* RAW files are generally pretty large and should be stored on the /work storage, where your limit is 10TB.
* Create a DIANN directory in your home folder (/onyen/diann). In that directory, create a unique directory for each project, and an additional one for all your fasta files. I've included several FASTA files on this repository for convenience. 
* Make adjustments to the config file in this repo. The most important changes are the location of the raw files (-f), and the fasta files (-fasta). By default, I have Carbamidomethyl as a fix modification, and oxidized Methionine and N-terminal acetylation set as variable modifications. Go to UniMod.org to find the relevant information for other modifications.
* Next, open the slurm file (run\_diann22.sl). It gives DIANN access to your /work directory, starts running DIANN, and gives it your configuration file. The things you need to update are the following: your email address after "--mail-user", which will email you when your slurm jobs start, finish, or fail. Update the directories on the last line, change /work/users/o/n/onyen/RAW to the directory with your raw files. Update the location of your config file (/home/onyen/DIANN/proj1/proj1\_config.txt--).
* Transfer the config file to the project-specific directory (ex. onyen/diann/proj1/config.txt), and transfer the slurm file (run\_diann22.sl) to the diann directory.
* To run it, you will type sbatch run\_diann22.sl





