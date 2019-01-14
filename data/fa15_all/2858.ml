
let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y then ((clone 0 (y - x)), y) else (x, (clone 0 (x - y)));;


(* fix

let rec clone x n =
  if n <= 0 then [] else (let y = clone x (n - 1) in x :: y);;

let padZero l1 l2 =
  let x = List.length l1 in
  let y = List.length l2 in
  if x < y
  then (((clone 0 (y - x)) @ l1), l2)
  else (l1, ((clone 0 (x - y)) @ l2));;

*)

(* changed spans
(8,18)-(8,23)
(@)
VarG

(8,18)-(8,23)
clone 0 (y - x)
AppG (fromList [BopG EmptyG EmptyG,LitG])

(8,36)-(8,37)
l1
VarG

(8,44)-(8,66)
l2
VarG

(8,45)-(8,46)
l1
VarG

(8,49)-(8,54)
(@)
VarG

(8,49)-(8,54)
clone 0 (x - y)
AppG (fromList [BopG EmptyG EmptyG,LitG])

*)
