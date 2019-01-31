
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference1 > 0
  then (clone 0 difference1) :: l1
  else if difference2 > 0 then (clone 0 difference2) :: l2;;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(8,16)-(8,27)
let retTuple = (l1 , l2) in
retTuple
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) VarG

(8,32)-(8,34)
(l1 , l2)
TupleG (fromList [VarG])

(9,7)-(9,58)
retTuple
VarG

*)
