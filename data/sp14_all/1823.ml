
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
(10,29)-(10,69)
additivePersistence (sumList (digits n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(9,4)-(10,71)
(9,29)-(10,69)
(10,3)-(10,69)
(10,25)-(10,69)
(10,29)-(10,69)
(10,30)-(10,49)
*)
