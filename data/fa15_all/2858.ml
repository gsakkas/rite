
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
(8,18)-(8,35)
clone 0 (y - x) @ l1
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(8,37)-(8,38)
l2
VarG

(8,46)-(8,47)
l1
VarG

(8,49)-(8,66)
clone 0 (x - y) @ l2
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(3,26)-(3,61)
(3,35)-(3,40)
(3,35)-(3,50)
(3,54)-(3,60)
(3,59)-(3,60)
(7,3)-(8,67)
(7,11)-(7,22)
(7,11)-(7,25)
(8,3)-(8,67)
(8,17)-(8,39)
(8,37)-(8,38)
(8,45)-(8,67)
(8,49)-(8,66)
(8,50)-(8,55)
*)
