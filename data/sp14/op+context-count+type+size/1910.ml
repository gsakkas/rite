
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
(5,40)-(5,55)
(5,47)-(5,55)
*)

(* type error slice
(2,4)-(5,67)
(2,15)-(5,64)
(5,40)-(5,45)
(5,40)-(5,55)
(5,47)-(5,48)
(5,47)-(5,55)
*)
