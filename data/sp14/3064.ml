
let rec digitsOfInt n = let l = [] in if n < 0 then l;;


(* fix

let rec digitsOfInt n = let l = [] in if n < 0 then l else l;;

*)

(* changed spans
(2,54)-(2,54)
l
VarG

*)

(* type error slice
(2,25)-(2,54)
(2,33)-(2,35)
(2,39)-(2,54)
(2,53)-(2,54)
(2,54)-(2,54)
*)
