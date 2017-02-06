
let rec digitsOfInt n = let l = [] in if n < 0 then l;;


(* fix

let rec digitsOfInt n = let l = [] in if n < 0 then l else l;;

*)

(* changed spans
(2,39)-(2,54)
*)

(* type error slice
(2,4)-(2,56)
(2,21)-(2,54)
(2,25)-(2,54)
(2,25)-(2,54)
(2,33)-(2,35)
(2,39)-(2,54)
(2,39)-(2,54)
(2,39)-(2,54)
(2,42)-(2,43)
(2,42)-(2,47)
(2,42)-(2,47)
(2,42)-(2,47)
(2,46)-(2,47)
(2,53)-(2,54)
*)
