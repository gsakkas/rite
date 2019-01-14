
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone (0, (abs numZeros)) in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

*)

(* changed spans
(6,2)-(10,77)
abs
VarG

(6,2)-(10,77)
numZeros
VarG

(6,2)-(10,77)
abs numZeros
AppG (fromList [VarG])

(6,2)-(10,77)
let absNumZeros =
  abs numZeros in
if numZeros = 0
then (l1 , l2)
else (let listZeros =
        clone 0 absNumZeros in
      if numZeros > 0
      then (l1 , listZeros @ l2)
      else (listZeros @ l1 , l2))
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(9,21)-(9,46)
clone 0 absNumZeros
AppG (fromList [VarG,LitG])

(9,36)-(9,44)
absNumZeros
VarG

*)
