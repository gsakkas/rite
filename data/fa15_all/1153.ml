
let rec clone x n = if n > 1 then x :: (clone x (n - 1));;


(* fix

let rec clone x n = x :: (clone x (n - 1));;

*)

(* changed spans
(2,21)-(2,57)
x :: (clone x (n - 1))
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(2,21)-(2,57)
(2,35)-(2,57)
(2,57)-(2,57)
*)
