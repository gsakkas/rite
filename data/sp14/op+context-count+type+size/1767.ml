
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else listReverse [[n mod 10] @ (digitsOfInt (n / 10))];;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else [n mod 10] @ (digitsOfInt (n / 10));;

*)

(* changed spans
(2,20)-(3,57)
(3,2)-(3,57)
(3,8)-(3,9)
(3,23)-(3,25)
(3,36)-(3,51)
(3,36)-(3,57)
(3,37)-(3,48)
(3,49)-(3,50)
(3,52)-(3,53)
(3,54)-(3,57)
(3,55)-(3,56)
(6,25)-(6,74)
*)

(* type error slice
(3,2)-(3,57)
(3,2)-(3,57)
(3,36)-(3,51)
(3,36)-(3,57)
(3,37)-(3,48)
(3,49)-(3,50)
(3,52)-(3,53)
(3,54)-(3,57)
(3,54)-(3,57)
(3,55)-(3,56)
(5,3)-(6,76)
(5,20)-(6,74)
(6,2)-(6,74)
(6,25)-(6,36)
(6,25)-(6,74)
(6,37)-(6,74)
(6,37)-(6,74)
(6,38)-(6,73)
(6,49)-(6,50)
(6,51)-(6,73)
(6,52)-(6,63)
*)
