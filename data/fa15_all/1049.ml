
let rec clone x n = match n with | 0 -> [] | _ -> [x; clone x (n - 1)];;


(* fix

let rec clone x n = match n with | 0 -> [] | _ -> x :: (clone x (n - 1));;

*)

(* changed spans
(2,51)-(2,71)
x :: (clone x (n - 1))
ConAppG (Just (TupleG (fromList [EmptyG])))

*)

(* type error slice
(2,4)-(2,73)
(2,15)-(2,71)
(2,17)-(2,71)
(2,21)-(2,71)
(2,51)-(2,71)
(2,55)-(2,60)
(2,55)-(2,70)
*)
