
let rec clone x n = if n < 1 then [] else x :: (clone (x (n - 1)));;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,47)-(2,66)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)
