
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 10 then 1 + additivePersistence else 0;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let x = sumList (digits n) in
  if x > 10 then 1 + (additivePersistence x) else 0;;

*)

(* changed spans
(5,16)-(5,70)
(8,2)-(8,71)
(8,5)-(8,35)
(8,15)-(8,26)
(8,33)-(8,35)
(8,41)-(8,42)
(8,41)-(8,64)
(8,45)-(8,64)
(8,70)-(8,71)
*)

(* type error slice
(7,3)-(8,73)
(7,28)-(8,71)
(8,41)-(8,64)
(8,45)-(8,64)
*)
