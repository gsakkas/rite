
let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) :: x);;


(* fix

let rec digitsOfInt n =
  if n < 0 then [] else (let x = n mod 10 in (digitsOfInt n) @ [x]);;

*)

(* changed spans
(3,46)-(3,66)
digitsOfInt n @ [x]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,69)
(2,21)-(3,67)
(3,3)-(3,67)
(3,25)-(3,67)
(3,34)-(3,42)
(3,46)-(3,61)
(3,46)-(3,66)
(3,47)-(3,58)
(3,65)-(3,66)
*)
