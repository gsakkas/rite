
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else ((listReverse n) mod 10) :: (listReverse (digitsOfInt (n / 10)));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0 then [] else (n mod 10) :: (listReverse (digitsOfInt (n / 10)));;

*)

(* changed spans
(8,9)-(8,24)
n
VarG

*)

(* type error slice
(3,3)-(3,58)
(3,37)-(3,52)
(3,38)-(3,49)
(3,50)-(3,51)
(6,6)-(6,7)
(6,6)-(6,12)
(6,11)-(6,12)
(8,9)-(8,24)
(8,10)-(8,21)
(8,22)-(8,23)
*)
