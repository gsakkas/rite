
let rec clone x n = let accum = [] in if n < 1 then [] else (clone x n) - 1;;


(* fix

let rec clone x n = let accum = [] in if n < 1 then [] else clone x n;;

*)

(* changed spans
(2,62)-(2,76)
(2,75)-(2,76)
*)

(* type error slice
(2,4)-(2,78)
(2,15)-(2,76)
(2,17)-(2,76)
(2,21)-(2,76)
(2,39)-(2,76)
(2,39)-(2,76)
(2,53)-(2,55)
(2,62)-(2,67)
(2,62)-(2,71)
(2,62)-(2,76)
(2,62)-(2,76)
*)
