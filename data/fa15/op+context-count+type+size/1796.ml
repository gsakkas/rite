
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then ((((clone 0) - n) @ l1), l2) else (l1, ((clone 0 n) @ l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

*)

(* changed spans
(7,18)-(7,33)
(7,19)-(7,28)
(7,31)-(7,32)
*)

(* type error slice
(3,54)-(3,71)
(3,55)-(3,60)
(7,17)-(7,39)
(7,18)-(7,33)
(7,18)-(7,33)
(7,19)-(7,28)
(7,20)-(7,25)
(7,34)-(7,35)
*)
