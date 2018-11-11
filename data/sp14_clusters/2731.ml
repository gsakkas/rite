
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
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)
