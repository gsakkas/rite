
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0 then l1 * (clone 0 a) else "bye";;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let a = (List.length l1) - (List.length l2) in
  if a > 0 then (l1, (clone 0 a)) else (l1, l2);;

*)

(* changed spans
(6,17)-(6,32)
(6,39)-(6,44)
*)

(* type error slice
(2,49)-(2,54)
(2,49)-(2,63)
(2,55)-(2,56)
(2,58)-(2,63)
(5,3)-(6,44)
(5,12)-(5,23)
(5,12)-(5,26)
(5,12)-(5,45)
(5,24)-(5,26)
(6,3)-(6,44)
(6,17)-(6,19)
(6,17)-(6,32)
(6,23)-(6,28)
(6,23)-(6,32)
(6,29)-(6,30)
(6,31)-(6,32)
(6,39)-(6,44)
*)
