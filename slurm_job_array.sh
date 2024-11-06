#!/bin/bash
#SBATCH --job-name=run_scripts                  ## Name of job on `squeue -u user.name`
#SBATCH --output=sbatch_outs/%A/%a.out          ## Where to put "results of what went right"
#SBATCH --error=sbatch_outs/%A/%a.err           ## Where to put "what went wrong"
#SBATCH --array=0-4%5                           ## Run 5 scripts with 5 parallel jobs
#SBATCH --time=00:05:00                         ## 5 minutes
#SBATCH --partition=cluster                     ## Partition [cip, cluster, inter]
#SBATCH --ntasks=1                              ## Tasks
#SBATCH --cpus-per-task=1                       ## CPUs
#SBATCH --mem=10MB                              ## MEMORY PER PARALLEL ARRAY JOB (!)
#SBATCH --mail-user=jed.homer@physik.lmu.de     ## Who to tell if it went wrong
#SBATCH --mail-type=begin,end,fail              ## What to tell them

# Each process takes its own ID 
id=$SLURM_ARRAY_TASK_ID

start=`date +%s`

# Tell us which process is running
echo "Currently running array index: " "${id}"

# Jump into the project dir
cd /home/j/Jed.Homer/test_stuff/

# Activate virtualenv
source .venv/bin/activate

# Run the python script
python script.py -i $id

end=`date +%s`

runtime=$((end-start))

echo "Time for index:" "${id}" "was" "${runtime}" "seconds"