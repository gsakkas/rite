
let rec clone x n = let accum = [] in if n < 1 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x (n - 1);;

*)

(* changed spans
(2,61)-(2,76)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)

(* type error slice
(2,39)-(2,76)
(2,53)-(2,55)
(2,61)-(2,76)
*)
