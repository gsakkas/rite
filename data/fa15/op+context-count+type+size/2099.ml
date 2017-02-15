
let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ x);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ [x]);;

*)

(* changed spans
(3,63)-(3,64)
*)

(* type error slice
(3,24)-(3,65)
(3,33)-(3,41)
(3,45)-(3,64)
(3,61)-(3,62)
(3,63)-(3,64)
*)
