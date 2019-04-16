
let rec clone x n = match n with | 0 -> [] | _ -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,56)-(2,73)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,75)
(2,15)-(2,73)
(2,17)-(2,73)
(2,21)-(2,73)
(2,51)-(2,73)
(2,56)-(2,73)
(2,57)-(2,68)
(2,58)-(2,63)
*)
