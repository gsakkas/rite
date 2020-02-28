
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then ((((clone 0 (-1)) * len) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len = (List.length l1) - (List.length l2) in
  if len <= 0
  then (((clone 0 ((-1) * len)) @ l1), l2)
  else (l1, ((clone 0 len) @ l2));;

*)

(* changed spans
(7,10)-(7,32)
clone 0 ((-1) * len)
AppG [LitG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(7,9)-(7,38)
(7,10)-(7,32)
(7,11)-(7,25)
(7,12)-(7,17)
(7,33)-(7,34)
*)
