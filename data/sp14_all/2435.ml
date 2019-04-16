
let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then ((List.append [0] l1), l2);;


(* fix

let padZero l1 l2 =
  if (List.length l1) = (List.length l2)
  then (l1, l2)
  else if (List.length l1) < (List.length l2) then (l1, l2) else (l1, l2);;

*)

(* changed spans
(5,53)-(5,73)
l1
VarG

(5,78)-(5,78)
(l1 , l2)
TupleG (fromList [VarG])

*)

(* type error slice
(5,8)-(5,78)
(5,52)-(5,78)
(5,78)-(5,78)
*)
