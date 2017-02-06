
let rec digitsOfInt n = match n <= 0 with | true  -> [] | false  -> 1;;


(* fix

let rec digitsOfInt n = match n <= 0 with | true  -> [] | false  -> [];;

*)

(* changed spans
(2,69)-(2,70)
*)

(* type error slice
(2,4)-(2,72)
(2,21)-(2,70)
(2,25)-(2,70)
(2,25)-(2,70)
(2,25)-(2,70)
(2,31)-(2,32)
(2,31)-(2,37)
(2,54)-(2,56)
(2,69)-(2,70)
*)
