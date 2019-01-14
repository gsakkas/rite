
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in l1 ^ (pad ^ l2)
  else (let pad = clone 0 (- sizDif) in (pad ^ l1) ^ l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(7,38)-(7,39)
(l1 , pad @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,45)-(7,46)
(@)
VarG

(8,45)-(8,46)
(@)
VarG

(8,51)-(8,52)
(pad @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

*)
