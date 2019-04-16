
let rec digitsOfInt n = if n < 0 then [] else n mod 10;;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [n mod 10];;

*)

(* changed spans
(2,47)-(2,55)
[n mod 10]
ListG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(2,25)-(2,55)
(2,39)-(2,41)
(2,47)-(2,55)
*)
