
let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  if difference1 > 0 then (l1, l2);;


(* fix

let padZero l1 l2 =
  let difference1 = (List.length l1) - (List.length l2) in
  let difference2 = (List.length l2) - (List.length l1) in
  let retTuple = (l1, l2) in retTuple;;

*)

(* changed spans
(5,2)-(5,34)
retTuple
VarG

(5,19)-(5,20)
let retTuple = (l1 , l2) in
retTuple
LetG NonRec (fromList [TupleG (fromList [EmptyG])]) VarG

*)
