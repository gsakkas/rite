
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
(5,39)-(5,58)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(5,67)
(2,15)-(5,65)
(5,39)-(5,58)
(5,40)-(5,45)
(5,46)-(5,57)
(5,47)-(5,48)
*)
