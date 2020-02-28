
let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ x);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ [x]);;

*)

(* changed spans
(3,64)-(3,65)
[x]
ListG [VarG]

*)

(* type error slice
(3,25)-(3,66)
(3,34)-(3,42)
(3,46)-(3,65)
(3,62)-(3,63)
(3,64)-(3,65)
*)
