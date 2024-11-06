# template_du_jour

This is a simple project template for use with both your local machine and/or the Physik cluster.

```
# Write some code
...

# Connect local code to github
echo "# template_du_jour" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin git@github.com:homerjed/template_du_jour.git
git push -u origin main

git status
git add . 

# Log onto cluster, then new cluster
ssh user.nameHomer@login.physik.uni-muenchen.de
ssh user.name@cluster-el9.hpc.physik.uni-muenchen.de

# Grab code from GitHub (loaded from local machine)
git clone git@github.com:homerjed/template_du_jour.git
cd template_du_jour/

# Need this for installing stuff NOTE: ASK FOR A GPU IF YOU'RE INSTALLING PACKAGES THAT USE A GPU 
intjob --partition=inter --ntasks=1 --cpus-per-task=1 --mem=1G --time=01:00:00 

# Create a virtual environment
python3 -m venv –-prompt test_env test_env
source test_env/bin/activate

# Important: make sure you're up to date
pip install --upgrade pip

# Install in DEVELOPMENT MODE
pip install -e . 

# Run a script to see
python script.py -i 10

# Batch job
sbatch slurm_job_array.sh
squeue -u user.name
```