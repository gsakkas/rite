
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1 :: pad) :: l2
  else (let pad = clone 0 (- sizDif) in (pad :: l1) :: l2);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

*)

(* changed spans
(7,35)-(7,46)
(l1 , pad @ l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(7,42)-(7,45)
(@)
VarG

(7,42)-(7,45)
pad @ l2
AppG (fromList [VarG])

(8,40)-(8,51)
(pad @ l1 , l2)
TupleG (fromList [VarG,AppG (fromList [EmptyG])])

(8,41)-(8,44)
(@)
VarG

(8,41)-(8,44)
pad @ l1
AppG (fromList [VarG])

*)
