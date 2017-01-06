
let append x l = match l with | [] -> [x] | h::t -> x :: l;;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;



let append x l =
  let rec helper x l acc =
    match x with | [] -> l | h::t -> helper t l (h :: acc) in
  helper x l [];;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;


(* changed spans
(2,18)-(2,23)
(2,39)-(2,42)
(2,53)-(2,54)
*)

(* type error slice
(5,34)-(5,53)
*)
