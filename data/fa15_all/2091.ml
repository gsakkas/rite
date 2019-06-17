
let rec clone x n = if n = 0 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = if n = 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,43)-(2,58)
x :: (clone x (n - 1))
AppG [VarG,AppG [EmptyG,EmptyG]]

*)

(* type error slice
(2,21)-(2,58)
(2,35)-(2,37)
(2,43)-(2,58)
*)
