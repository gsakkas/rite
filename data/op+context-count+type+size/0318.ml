
let append x l = match l with | [] -> [x] | h::t -> x :: l;;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;


(* fix

let append x l =
  let rec helper x l acc =
    match x with | [] -> l | h::t -> helper t l (h :: acc) in
  helper x l [];;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(2,18)-(2,59)
(2,24)-(2,25)
(2,39)-(2,42)
(2,53)-(2,54)
(2,53)-(2,59)
(4,21)-(5,66)
(5,26)-(5,32)
(5,34)-(5,45)
(5,34)-(5,53)
(5,47)-(5,48)
(5,47)-(5,53)
(5,51)-(5,53)
(5,56)-(5,66)
(5,57)-(5,58)
(5,57)-(5,65)
(5,63)-(5,65)
*)

(* type error slice
(4,4)-(5,68)
(4,21)-(5,66)
(5,3)-(5,66)
(5,6)-(5,7)
(5,6)-(5,12)
(5,11)-(5,12)
(5,18)-(5,20)
(5,34)-(5,45)
(5,34)-(5,53)
(5,47)-(5,53)
*)
