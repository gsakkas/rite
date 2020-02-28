
let rec clone x n = if x <= 0 then [] else [clone x];;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,24)-(2,25)
n
VarG

(2,44)-(2,53)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,4)-(2,55)
(2,15)-(2,53)
(2,17)-(2,53)
(2,21)-(2,53)
(2,44)-(2,53)
(2,45)-(2,50)
(2,45)-(2,52)
*)
