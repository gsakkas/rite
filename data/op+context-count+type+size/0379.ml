
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0 then (((clone (-1)) * (l l2)), l2) else (l1, (clone l l2));;



let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l2), l2)
  else (l1, ((clone 0 l) @ l2));;


(* changed spans
(6,30)-(6,31)
(6,34)-(6,35)
(6,37)-(6,39)
*)

(* type error slice
(5,12)-(5,26)
*)
