
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0 then (((clone (-1)) * (l l2)), l2) else (l1, (clone l l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l2), l2)
  else (l1, ((clone 0 l) @ l2));;

*)

(* changed spans
(6,18)-(6,30)
clone 0 ((-1) * l) @ l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(6,19)-(6,24)
(@)
VarG

(6,19)-(6,24)
clone 0 ((-1) * l)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(6,25)-(6,29)
(-1) * l
BopG LitG VarG

(6,25)-(6,29)
0
LitG

(6,57)-(6,62)
(@)
VarG

(6,57)-(6,62)
clone 0 l
AppG (fromList [VarG,LitG])

(6,63)-(6,64)
0
LitG

*)
