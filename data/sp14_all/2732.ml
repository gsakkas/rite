
let rec clone x n = match n with | 0 -> [] | h::t -> x :: ((clone x n) - 1);;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

*)

(* changed spans
(2,21)-(2,76)
if n < 1
then []
else x :: (clone x (n - 1))
IteG (BopG EmptyG EmptyG) (ListG (fromList [])) (ConAppG (Just EmptyG))

*)

(* type error slice
(2,4)-(2,78)
(2,15)-(2,76)
(2,17)-(2,76)
(2,21)-(2,76)
(2,54)-(2,76)
(2,59)-(2,76)
(2,60)-(2,71)
(2,61)-(2,66)
*)
