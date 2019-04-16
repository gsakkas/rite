
let rec clone x n = let i = 0 in if i < n then x :: ((clone x n) - 1) else [];;


(* fix

let rec clone x n = let i = 0 in if i < n then x :: (clone x (n - 1)) else [];;

*)

(* changed spans
(2,53)-(2,70)
clone x (n - 1)
AppG (fromList [VarG,BopG EmptyG EmptyG])

*)

(* type error slice
(2,4)-(2,80)
(2,15)-(2,78)
(2,17)-(2,78)
(2,21)-(2,78)
(2,34)-(2,78)
(2,48)-(2,70)
(2,53)-(2,70)
(2,54)-(2,65)
(2,55)-(2,60)
(2,76)-(2,78)
*)
