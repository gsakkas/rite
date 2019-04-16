
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
(8,31)-(8,53)
digitsOfInt (n / 10)
AppG (fromList [BopG EmptyG EmptyG])

*)

(* type error slice
(5,4)-(8,74)
(5,21)-(8,72)
(6,3)-(8,72)
(7,8)-(7,10)
(8,18)-(8,53)
(8,29)-(8,30)
(8,31)-(8,53)
(8,32)-(8,47)
(8,33)-(8,44)
*)
