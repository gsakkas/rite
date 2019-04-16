
let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  if numZeros = 0 then (l1, l2);;


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
(4,3)-(4,32)
let absNumZeros =
  abs numZeros in
if numZeros = 0
then (l1 , l2)
else (let listZeros =
        clone 0 absNumZeros in
      if numZeros > 0
      then (l1 , listZeros @ l2)
      else (listZeros @ l1 , l2))
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(4,3)-(4,32)
(4,24)-(4,32)
(4,32)-(4,32)
*)
