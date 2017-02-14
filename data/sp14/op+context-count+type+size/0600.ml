
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let sum = 0 in
  if n < 10 then n + sum else sum = (digitalRoot (sumList (digitsOfInt n)));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let sum = 0 in if n < 10 then n else digitalRoot (sumList (digitsOfInt n));;

*)

(* changed spans
(9,17)-(9,24)
(9,21)-(9,24)
(9,30)-(9,33)
(9,30)-(9,75)
*)

(* type error slice
(9,2)-(9,75)
(9,2)-(9,75)
(9,17)-(9,24)
(9,30)-(9,75)
*)
