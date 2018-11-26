
let padZero l1 l2 = if (List.length l1) = (List.length l2) then (l1, l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(2,20)-(2,72)
(l1 , l2)
TupleG (fromList [VarG])

*)
