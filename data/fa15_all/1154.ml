
let rec clone x n = if n > 1 then x @ (clone x (n - 1));;


(* fix

let rec clone x n = x :: (clone x (n - 1));;

*)

(* changed spans
(2,21)-(2,56)
x :: (clone x (n - 1))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(2,21)-(2,56)
(2,35)-(2,56)
(2,37)-(2,38)
(2,56)-(2,56)
*)
