
let rec digitsOfInt n = match n <= 0 with | true  -> [] | false  -> 1;;


(* fix

let rec digitsOfInt n = match n <= 0 with | true  -> [] | false  -> [];;

*)

(* changed spans
(2,68)-(2,69)
*)

(* type error slice
(2,24)-(2,69)
(2,53)-(2,55)
(2,68)-(2,69)
*)

(* all spans
(2,20)-(2,69)
(2,24)-(2,69)
(2,30)-(2,36)
(2,30)-(2,31)
(2,35)-(2,36)
(2,53)-(2,55)
(2,68)-(2,69)
*)
