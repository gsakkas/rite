
let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (match n with | n -> [] @ [n mod 10]);;

*)

(* changed spans
(3,51)-(3,61)
*)

(* type error slice
(3,46)-(3,61)
(3,49)-(3,50)
(3,51)-(3,61)
*)

(* all spans
(2,20)-(3,62)
(3,2)-(3,62)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,62)
(3,32)-(3,33)
(3,46)-(3,61)
(3,49)-(3,50)
(3,46)-(3,48)
(3,51)-(3,61)
(3,52)-(3,53)
(3,58)-(3,60)
*)
