
let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone (x (n - 1))) @ [x]);;


(* fix

let rec clone x n =
  if n < 0
  then []
  else (match n with | 0 -> [] | _ -> (clone x (n - 1)) @ [x]);;

*)

(* changed spans
(5,38)-(5,57)
(5,45)-(5,56)
*)

(* type error slice
(2,3)-(5,66)
(2,14)-(5,64)
(5,38)-(5,57)
(5,39)-(5,44)
(5,45)-(5,56)
(5,46)-(5,47)
*)
