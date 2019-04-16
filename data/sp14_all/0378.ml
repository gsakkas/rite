
let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone ((x n) - 1));;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,56)-(2,75)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,77)
(2,15)-(2,75)
(2,56)-(2,75)
(2,57)-(2,62)
(2,63)-(2,74)
(2,64)-(2,69)
(2,65)-(2,66)
*)
