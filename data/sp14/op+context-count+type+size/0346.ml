
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
(6,17)-(6,40)
(6,18)-(6,30)
(6,19)-(6,24)
(6,25)-(6,29)
(6,33)-(6,39)
(6,57)-(6,62)
(6,63)-(6,64)
(6,65)-(6,67)
*)

(* type error slice
(2,48)-(2,65)
(2,49)-(2,54)
(5,2)-(6,69)
(5,10)-(5,45)
(6,17)-(6,40)
(6,18)-(6,30)
(6,19)-(6,24)
(6,33)-(6,39)
(6,34)-(6,35)
(6,56)-(6,68)
(6,57)-(6,62)
*)
