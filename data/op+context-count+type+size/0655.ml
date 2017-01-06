
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let sum = 0 in
  if n < 10 then n + sum else sum = (digitalRoot (sumList (digitsOfInt n)));;



let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  let sum = 0 in if n < 10 then n else digitalRoot (sumList (digitsOfInt n));;


(* changed spans
(9,20)-(9,25)
(9,31)-(9,38)
(9,75)-(9,76)
*)

(* type error slice
(3,18)-(3,52)
*)
