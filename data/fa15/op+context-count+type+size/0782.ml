
let rec digitsOfInt n =
  if n <= 0 then [] else ((digitsOfInt n) mod 10) @ [n mod 10];;


(* fix

let rec digitsOfInt n = if n <= 0 then [] else (digitsOfInt n) @ [n mod 10];;

*)

(* changed spans
(3,25)-(3,49)
(3,46)-(3,48)
*)

(* type error slice
(2,3)-(3,64)
(2,20)-(3,62)
(3,2)-(3,62)
(3,17)-(3,19)
(3,25)-(3,49)
(3,25)-(3,49)
(3,25)-(3,62)
(3,26)-(3,41)
(3,27)-(3,38)
(3,50)-(3,51)
*)
