
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
(8,30)-(8,52)
(8,44)-(8,45)
*)

(* type error slice
(5,3)-(8,73)
(5,20)-(8,71)
(6,2)-(8,71)
(7,7)-(7,9)
(8,17)-(8,52)
(8,28)-(8,29)
(8,30)-(8,52)
(8,30)-(8,52)
(8,31)-(8,46)
(8,32)-(8,43)
*)
