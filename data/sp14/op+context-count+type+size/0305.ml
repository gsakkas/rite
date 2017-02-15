
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
(8,12)-(8,31)
(8,14)-(8,19)
*)

(* type error slice
(7,8)-(7,35)
(7,9)-(7,29)
(7,10)-(7,15)
(7,30)-(7,31)
(7,32)-(7,34)
(8,12)-(8,31)
(8,12)-(8,31)
(8,13)-(8,24)
(8,14)-(8,19)
(8,28)-(8,30)
*)
