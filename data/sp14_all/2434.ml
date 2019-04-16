
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (([0] @ l1), l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(5,53)-(5,63)
l1
VarG

(5,68)-(5,68)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* type error slice
(5,8)-(5,68)
(5,52)-(5,68)
(5,68)-(5,68)
*)
