
let rec clone x n = if n <= 0 then [] else x :: ((x clone x n) - 1);;


(* fix

let rec clone x n = if n <= 0 then [] else clone x (n - 1);;

*)

(* changed spans
(2,44)-(2,68)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,44)-(2,68)
(2,49)-(2,68)
(2,50)-(2,63)
(2,51)-(2,52)
(2,59)-(2,60)
*)
