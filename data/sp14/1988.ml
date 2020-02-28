
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
(7,8)-(7,72)
getDigits n
AppG [VarG]

*)

(* type error slice
(2,24)-(2,78)
(2,59)-(2,60)
(2,59)-(2,78)
(2,64)-(2,78)
(2,65)-(2,73)
(2,74)-(2,75)
(4,4)-(7,74)
(4,21)-(7,72)
(5,3)-(7,72)
(7,8)-(7,72)
(7,22)-(7,30)
(7,22)-(7,64)
(7,31)-(7,53)
(7,32)-(7,43)
(7,32)-(7,52)
*)
