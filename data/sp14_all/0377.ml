
let rec clone x n = match n with | 0 -> [] | _ -> x :: ((clone n) - 1);;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,56)-(2,71)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,73)
(2,15)-(2,71)
(2,17)-(2,71)
(2,51)-(2,71)
(2,56)-(2,71)
(2,57)-(2,66)
(2,58)-(2,63)
*)
