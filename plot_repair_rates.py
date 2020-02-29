import sys
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import mlab
import csv
from os.path import join, dirname, exists, isfile, basename
from os import listdir, mkdir, environ

repaired_naive = []
repaired_rite = []
preds_loc = "./data/fa15/known+clusters+all/dnn-50-multiclass"
test = sorted([int(basename(f).split(".")[0]) for f in listdir(preds_loc) if f.endswith('.csv')])

num_programs = len(test)

def is_int(s):
    if s[0] in ('-', '+'):
        return s[1:].isdigit()
    return s.isdigit()

progs = sys.argv[1]

if is_int(progs):
    num_programs = int(progs)
    test = test[:num_programs]

with open("./data/naive_times_" + progs + ".csv", 'r') as fin:
    csv_in = csv.reader(fin)
    repaired_naive_num = 0
    for row in csv_in:
        if row[0] != "Program" and int(row[0]) in test:
            if repaired_naive_num > 0:
                repaired_naive.append((int(row[0]), float(row[1])))
            repaired_naive_num += 1
        else:
            repaired_naive_num += 1

with open("./data/rite_times_" + progs + ".csv", 'r') as fin:
    csv_in = csv.reader(fin)
    repaired_rite_num = 0
    for row in csv_in:
        if row[0] != "Program" and int(row[0]) in test:
            if repaired_rite_num > 0:
                repaired_rite.append((int(row[0]), float(row[1])))
            repaired_rite_num += 1
        else:
            repaired_naive_num += 1

def rate(secs, times):
    in_set = list(filter(lambda x: x[1] <= secs, times))
    return len(in_set) * 100.0 / num_programs

plt.rc('text', usetex=True)
plt.rc('font', family='serif')

fig, ax = plt.subplots(figsize=(5, 3.5))
xs = list(range(0, 91))
naive_ys = list(map(lambda x: rate(x, repaired_naive), xs))
rite_ys = list(map(lambda x: rate(x, repaired_rite), xs))

ax.step(xs, rite_ys, where='mid', linewidth=1.3, label='Rite')
ax.step(xs, naive_ys, where='mid', linewidth=1.3, label='Naive')

ax.set_xlim([0, 90])
ax.set_ylim([0, 100])

ax.grid(True)
ax.legend(loc='upper left')
ax.set_xlabel('Synthesis Time (sec.)')
ax.set_ylabel('Repair Rate (\%)')

plt.tight_layout()
plt.show()

print(naive_ys[::5])
print(rite_ys[::5])
