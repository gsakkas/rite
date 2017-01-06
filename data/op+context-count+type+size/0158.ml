
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec digitsOfInt n =
  if n = 0
  then [0]
  else if n > 0 then myAppend [digitsOfInt (n / 10)] (n mod 10) else [];;



let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;


(* changed spans
(4,9)-(4,20)
(5,3)-(5,5)
(5,8)-(5,9)
(6,3)-(6,7)
(6,9)-(6,10)
(7,3)-(7,21)
(7,31)-(7,43)
(7,52)-(7,53)
(7,65)-(7,69)
*)

(* type error slice
(7,32)-(7,51)
*)
