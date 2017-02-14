
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
(6,20)-(6,25)
(6,20)-(6,29)
(6,20)-(6,39)
(6,27)-(6,29)
(6,35)-(6,39)
(6,58)-(6,63)
(6,64)-(6,65)
(6,66)-(6,68)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(5,3)-(6,68)
(5,12)-(5,45)
(6,20)-(6,25)
(6,20)-(6,29)
(6,20)-(6,39)
(6,35)-(6,36)
(6,35)-(6,39)
(6,58)-(6,63)
(6,58)-(6,68)
*)
