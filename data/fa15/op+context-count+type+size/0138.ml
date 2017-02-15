
let rec digitsOfInt n = if n < 0 then [] else [[]; n mod 10];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [] @ [n mod 10];;

*)

(* changed spans
(2,46)-(2,60)
(2,47)-(2,49)
(2,51)-(2,59)
*)

(* type error slice
(2,46)-(2,60)
(2,46)-(2,60)
(2,47)-(2,49)
(2,51)-(2,59)
*)
