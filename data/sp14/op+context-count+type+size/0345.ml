
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l2), l2)
  else (l1, ((clone 0 l) :: l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let l = (List.length l1) - (List.length l2) in
  if l < 0
  then (((clone 0 ((-1) * l)) @ l2), l2)
  else (l1, ((clone 0 l) @ l2));;

*)

(* changed spans
(8,15)-(8,20)
(8,15)-(8,31)
*)

(* type error slice
(7,11)-(7,16)
(7,11)-(7,28)
(7,11)-(7,35)
(7,31)-(7,32)
(7,33)-(7,35)
(8,15)-(8,20)
(8,15)-(8,24)
(8,15)-(8,31)
(8,15)-(8,31)
(8,29)-(8,31)
*)
