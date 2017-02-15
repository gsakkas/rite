
let rec digitsOfInt n = let l = [] in if n < 0 then l;;


(* fix

let rec digitsOfInt n = let l = [] in if n < 0 then l else l;;

*)

(* changed spans
(2,38)-(2,53)
*)

(* type error slice
(2,24)-(2,53)
(2,32)-(2,34)
(2,38)-(2,53)
(2,38)-(2,53)
(2,38)-(2,53)
(2,52)-(2,53)
*)
