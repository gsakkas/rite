
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else listReverse [[n mod 10] @ (digitsOfInt (n / 10))];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(6,26)-(6,75)
[n mod 10] @ digitsOfInt (n / 10)
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(3,58)
(3,37)-(3,52)
(3,37)-(3,58)
(3,38)-(3,49)
(3,50)-(3,51)
(3,53)-(3,54)
(3,55)-(3,58)
(3,56)-(3,57)
(5,4)-(6,77)
(5,21)-(6,75)
(6,3)-(6,75)
(6,26)-(6,37)
(6,26)-(6,75)
(6,38)-(6,75)
(6,39)-(6,74)
(6,50)-(6,51)
(6,52)-(6,74)
(6,53)-(6,64)
*)
