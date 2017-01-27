
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let n2 = [n mod 10] @ ((digitsOfInt n) / 10) in listReverse n2);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else (let n2 = [n mod 10] @ (digitsOfInt (n / 10)) in listReverse n2);;

*)

(* changed spans
(8,33)-(8,52)
(8,45)-(8,46)
*)

(* type error slice
(5,4)-(8,74)
(5,21)-(8,71)
(6,3)-(8,71)
(6,6)-(6,7)
(6,6)-(6,12)
(6,11)-(6,12)
(7,8)-(7,10)
(8,18)-(8,28)
(8,18)-(8,52)
(8,19)-(8,27)
(8,29)-(8,30)
(8,33)-(8,44)
(8,33)-(8,46)
(8,33)-(8,52)
(8,45)-(8,46)
*)
