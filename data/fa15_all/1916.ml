
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0
  then n mod 10
  else additivePersistence (sumList digitsOfInt n);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0
  then n mod 10
  else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(10,28)-(10,51)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(5,56)-(5,71)
(5,60)-(5,71)
(5,61)-(5,68)
(10,28)-(10,51)
(10,29)-(10,36)
*)
