
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
(5,17)-(5,70)
(8,3)-(8,72)
(8,7)-(8,36)
(8,16)-(8,27)
(8,34)-(8,36)
(8,42)-(8,43)
(8,42)-(8,65)
(8,46)-(8,65)
(8,71)-(8,72)
*)

(* type error slice
(7,4)-(8,74)
(7,29)-(8,72)
(8,42)-(8,65)
(8,46)-(8,65)
*)
