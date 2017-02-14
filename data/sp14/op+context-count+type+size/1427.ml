
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
(8,8)-(8,23)
(8,9)-(8,20)
*)

(* type error slice
(3,2)-(3,57)
(3,2)-(3,57)
(3,2)-(3,57)
(3,2)-(3,57)
(3,36)-(3,51)
(3,37)-(3,48)
(3,49)-(3,50)
(6,5)-(6,6)
(6,5)-(6,11)
(6,5)-(6,11)
(6,10)-(6,11)
(8,8)-(8,23)
(8,9)-(8,20)
(8,21)-(8,22)
*)
