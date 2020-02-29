import sys
import timeit
import csv
from os.path import join, dirname, exists, isfile, basename
from os import listdir, mkdir, environ
import subprocess

preds_loc = "./data/fa15/known+clusters+all/dnn-50-multiclass"
test = sorted([int(basename(f).split(".")[0]) for f in listdir(preds_loc) if f.endswith('.csv')])

num_programs = len(test)
repaired = []

def is_int(s):
    if s[0] in ('-', '+'):
        return s[1:].isdigit()
    return s.isdigit()

progs = sys.argv[1]
if is_int(progs):
    num_programs = int(progs)
    test = test[:num_programs]

for i in test:
    start_time = timeit.default_timer()
    cp = subprocess.run(["stack", "exec", "--", "make-fixes", "--source",
     "features/data/ucsd/data/derived/fa15/pairs.json", "--mode", "tiny-naive",
     "--predictions", "./data/fa15/known+clusters+all/dnn-50-multiclass",
     "--clusters", "./data/sp14/clusters", "--out",
     "./data/fa15/repaired/naive", "--file", str(i)], capture_output=True)
    output = cp.stdout.decode('ascii').split(",[")[0].split()[-1]
    elapsed = timeit.default_timer() - start_time
    if output != "Nothing":
        if output[2:-1].split(",")[0] == "100.0":
            repaired.append((i, elapsed))

with open("./data/naive_times_" + progs + ".csv", 'w') as fout:
    csv_out = csv.writer(fout)
    csv_out.writerow(['Program', 'Time (sec.)'])
    for row in repaired:
        csv_out.writerow(row)

print("Naive:")
sec10 = list(filter(lambda x: x[1] <= 10, repaired))
sec20 = list(filter(lambda x: x[1] <= 20, repaired))
sec30 = list(filter(lambda x: x[1] <= 30, repaired))
sec40 = list(filter(lambda x: x[1] <= 40, repaired))
sec50 = list(filter(lambda x: x[1] <= 50, repaired))
sec60 = list(filter(lambda x: x[1] <= 60, repaired))
sec70 = list(filter(lambda x: x[1] <= 70, repaired))
sec80 = list(filter(lambda x: x[1] <= 80, repaired))
sec90 = list(filter(lambda x: x[1] <= 90, repaired))

rate10 = len(sec10) / num_programs
rate20 = len(sec20) / num_programs
rate30 = len(sec30) / num_programs
rate40 = len(sec40) / num_programs
rate50 = len(sec50) / num_programs
rate60 = len(sec60) / num_programs
rate70 = len(sec70) / num_programs
rate80 = len(sec80) / num_programs
rate90 = len(sec90) / num_programs

print("10 sec: Repair rate =", rate10)
print("20 sec: Repair rate =", rate20)
print("30 sec: Repair rate =", rate30)
print("40 sec: Repair rate =", rate40)
print("50 sec: Repair rate =", rate50)
print("60 sec: Repair rate =", rate60)
print("70 sec: Repair rate =", rate70)
print("80 sec: Repair rate =", rate80)
print("90 sec: Repair rate =", rate90)

repaired = []

for i in test:
    start_time = timeit.default_timer()
    cp = subprocess.run(["stack", "exec", "--", "make-fixes", "--source",
     "features/data/ucsd/data/derived/fa15/pairs.json", "--mode", "tiny",
     "--predictions", "./data/fa15/known+clusters+all/dnn-50-multiclass",
     "--clusters", "./data/sp14/clusters", "--out",
     "./data/fa15/repaired/rite", "--file", str(i)], capture_output=True)
    output = cp.stdout.decode('ascii').split(",[")[0].split()[-1]
    elapsed = timeit.default_timer() - start_time
    if output != "Nothing":
        if output[2:-1].split(",")[0] == "100.0":
            repaired.append((i, elapsed))

with open("./data/rite_times_" + progs + ".csv", 'w') as fout:
    csv_out = csv.writer(fout)
    csv_out.writerow(['Program', 'Time (sec.)'])
    for row in repaired:
        csv_out.writerow(row)

print("Rite:")
sec10 = list(filter(lambda x: x[1] <= 10, repaired))
sec20 = list(filter(lambda x: x[1] <= 20, repaired))
sec30 = list(filter(lambda x: x[1] <= 30, repaired))
sec40 = list(filter(lambda x: x[1] <= 40, repaired))
sec50 = list(filter(lambda x: x[1] <= 50, repaired))
sec60 = list(filter(lambda x: x[1] <= 60, repaired))
sec70 = list(filter(lambda x: x[1] <= 70, repaired))
sec80 = list(filter(lambda x: x[1] <= 80, repaired))
sec90 = list(filter(lambda x: x[1] <= 90, repaired))

rate10 = len(sec10) / num_programs
rate20 = len(sec20) / num_programs
rate30 = len(sec30) / num_programs
rate40 = len(sec40) / num_programs
rate50 = len(sec50) / num_programs
rate60 = len(sec60) / num_programs
rate70 = len(sec70) / num_programs
rate80 = len(sec80) / num_programs
rate90 = len(sec90) / num_programs

print("10 sec: Repair rate =", rate10)
print("20 sec: Repair rate =", rate20)
print("30 sec: Repair rate =", rate30)
print("40 sec: Repair rate =", rate40)
print("50 sec: Repair rate =", rate50)
print("60 sec: Repair rate =", rate60)
print("70 sec: Repair rate =", rate70)
print("80 sec: Repair rate =", rate80)
print("90 sec: Repair rate =", rate90)
