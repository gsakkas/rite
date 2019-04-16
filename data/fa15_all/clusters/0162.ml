LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)
let numZeros =
  List.length l1 - List.length l2 in
let absNumZeros =
  abs numZeros in
if numZeros = 0
then (l1 , l2)
else (let listZeros =
        clone 0 absNumZeros in
      if numZeros > 0
      then (l1 , listZeros @ l2)
      else (listZeros @ l1 , l2))
