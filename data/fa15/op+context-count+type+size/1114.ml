
let rec digitsOfInt n = if n < 0 then [] else if n < 10 then [n];;


(* fix

let rec digitsOfInt n = if n < 0 then [] else [];;

*)

(* changed spans
(2,46)-(2,64)
(2,49)-(2,55)
(2,61)-(2,64)
*)

(* type error slice
(2,46)-(2,64)
(2,46)-(2,64)
(2,46)-(2,64)
(2,61)-(2,64)
*)

(* all spans
(2,20)-(2,64)
(2,24)-(2,64)
(2,27)-(2,32)
(2,27)-(2,28)
(2,31)-(2,32)
(2,38)-(2,40)
(2,46)-(2,64)
(2,49)-(2,55)
(2,49)-(2,50)
(2,53)-(2,55)
(2,61)-(2,64)
(2,62)-(2,63)
(2,46)-(2,64)
*)
