.PHONY: ucsd-sp14 ucsd-fa15 ucsd-comb seminal

ucsd-sp14:
	stack exec -- check-all-from data/ucsd/data/derived/sp14/progs/unify ucsd-sp14.csv +RTS -N4 -RTS 2>&1 | tee ucsd-sp14.log

ucsd-fa15:
	stack exec -- check-all-from data/ucsd/data/derived/fa15/progs/unify ucsd-fa15.csv +RTS -N4 -RTS 2>&1 | tee ucsd-fa15.log

ucsd-comb:
	stack exec -- check-all-from data/ucsd/comb ucsd-comb.csv +RTS -N4 -RTS 2>&1 | tee ucsd-comb.log

seminal:
	stack exec -- check-all-from data/seminal seminal.csv +RTS -N4 -RTS 2>&1 | tee seminal.log
