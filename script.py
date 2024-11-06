import argparse
from functions import square, time_now

parser = argparse.ArgumentParser()
parser.add_argument("-i", type=int, help="Slurm job array index")
args = parser.parse_args()

print("The date and time now is {}".format(time_now()))
print("The square of {} is {}".format(args.i, square(args.i)))