
let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then ((((clone 0) - n) :: l1), l2) else (l1, ((clone 0 n) :: l2));;


(* fix

let rec clone x n =
  if n <= 0 then [] else if n = 1 then [x] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n < 0 then (((clone 0 (- n)) @ l1), l2) else (l1, ((clone 0 n) @ l2));;

*)

(* changed spans
(7,21)-(7,26)
(7,21)-(7,28)
(7,21)-(7,33)
(7,21)-(7,40)
(7,32)-(7,33)
(7,59)-(7,64)
(7,59)-(7,75)
*)

(* type error slice
(3,56)-(3,61)
(3,56)-(3,70)
(7,21)-(7,26)
(7,21)-(7,28)
(7,21)-(7,33)
*)
