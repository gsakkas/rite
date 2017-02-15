
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2 then x1 @ (clone 0 (x2 - x1)) else x2 @ (clone 0 (x1 - x2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then ((l1 @ (clone 0 (x2 - x1))), l2)
  else (l1, (l2 @ (clone 0 (x1 - x2))));;

*)

(* changed spans
(7,18)-(7,20)
(7,18)-(7,42)
(7,48)-(7,50)
(7,48)-(7,72)
(7,63)-(7,65)
(7,68)-(7,70)
*)

(* type error slice
(5,2)-(7,72)
(5,11)-(5,22)
(5,11)-(5,25)
(6,2)-(7,72)
(6,11)-(6,22)
(6,11)-(6,25)
(7,18)-(7,20)
(7,18)-(7,42)
(7,21)-(7,22)
(7,48)-(7,50)
(7,48)-(7,72)
(7,51)-(7,52)
*)
