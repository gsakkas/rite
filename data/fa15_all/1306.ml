
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference1 > 0 then (clone 0 2) :: l1;;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(7,2)-(7,43)
l2
VarG

(7,35)-(7,36)
let retTuple = (l1 , l2) in
retTuple
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) VarG

(7,41)-(7,43)
(l1 , l2)
TupleG (fromList [VarG])

*)
