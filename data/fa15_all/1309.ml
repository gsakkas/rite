
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
(5,3)-(5,35)
let retTuple = (l1 , l2) in
retTuple
LetG NonRec (fromList [(VarPatG,TupleG (fromList [EmptyG]))]) VarG

*)

(* type error slice
(5,3)-(5,35)
(5,27)-(5,35)
(5,35)-(5,35)
*)
