
let rec clone x n = if n <= 0 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,44)-(2,59)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,21)-(2,59)
(2,36)-(2,38)
(2,44)-(2,59)
*)
