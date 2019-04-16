
let padZero l1 l2 = if (List.length l1) = (List.length l2) then [(l1, l2)];;


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
(2,21)-(2,75)
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
LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(2,21)-(2,75)
(2,65)-(2,75)
(2,75)-(2,75)
*)
