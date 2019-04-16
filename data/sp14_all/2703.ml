
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
(9,18)-(9,25)
n
VarG

(9,31)-(9,76)
digitalRoot (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(9,3)-(9,76)
(9,18)-(9,25)
(9,31)-(9,76)
*)
