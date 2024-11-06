from datetime import datetime
import numpy as np 


def square(x):
    return np.square(x)


def time_now():
    return datetime.now().strftime("%Y-%m-%d %H:%M")