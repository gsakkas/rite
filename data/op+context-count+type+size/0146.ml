
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else if n > 0 then myAppend [digitsOfInt (n / 10)] (n mod 10) else [];;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

*)

(* changed spans
(5,3)-(7,72)
(5,6)-(5,7)
(5,6)-(5,11)
(5,10)-(5,11)
(6,8)-(6,11)
(6,9)-(6,10)
(7,8)-(7,72)
(7,11)-(7,16)
(7,15)-(7,16)
(7,31)-(7,53)
(7,32)-(7,43)
(7,70)-(7,72)
*)

(* type error slice
(4,4)-(7,74)
(4,21)-(7,72)
(5,3)-(7,72)
(5,6)-(5,7)
(5,6)-(5,11)
(5,10)-(5,11)
(6,8)-(6,11)
(6,9)-(6,10)
(7,32)-(7,43)
(7,32)-(7,51)
(7,45)-(7,51)
*)
