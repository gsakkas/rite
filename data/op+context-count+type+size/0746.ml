
let rec clone x n = let accum = [] in if n < 1 then [] else (clone x n) - 1;;



let rec clone x n = let accum = [] in if n < 1 then [] else clone x (n - 1);;


(* changed spans
(2,61)-(2,62)
(2,71)-(2,72)
*)

(* type error slice
(2,39)-(2,76)
*)
