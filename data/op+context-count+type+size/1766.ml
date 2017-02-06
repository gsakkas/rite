
let rec digitsOfInt n = if n <= 0 then [] else 1;;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else [1];;

*)

(* changed spans
(2,48)-(2,49)
*)

(* type error slice
(2,4)-(2,51)
(2,21)-(2,49)
(2,25)-(2,49)
(2,25)-(2,49)
(2,28)-(2,29)
(2,28)-(2,34)
(2,40)-(2,42)
(2,48)-(2,49)
*)
