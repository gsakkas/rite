
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence sumList (digits n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(10,28)-(10,68)
(10,49)-(10,56)
*)

(* type error slice
(9,3)-(10,70)
(9,28)-(10,68)
(10,2)-(10,68)
(10,17)-(10,18)
(10,28)-(10,68)
(10,29)-(10,48)
*)
