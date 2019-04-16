
let rec clone x n = match n with | 0 -> [] | _ -> [(clone x n) - 1; x];;


(* fix

let helper (x,m) = x :: m;;

let rec clone x n = match n with | 0 -> [] | _ -> helper (x, (clone x n));;

*)

(* changed spans
(2,51)-(2,71)
helper (x , clone x n)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(2,73)
(2,15)-(2,71)
(2,17)-(2,71)
(2,21)-(2,71)
(2,51)-(2,71)
(2,52)-(2,63)
(2,52)-(2,67)
(2,53)-(2,58)
*)
