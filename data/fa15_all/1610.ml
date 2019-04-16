
let rec digitsOfInt n = if n < 0 then [] else [[]; n mod 10];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(2,47)-(2,61)
[] @ [n mod 10]
AppG (fromList [ListG (fromList []),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,47)-(2,61)
(2,48)-(2,50)
(2,52)-(2,60)
*)
