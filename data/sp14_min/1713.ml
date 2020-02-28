
let rec helperAppend l n =
  match l with | [] -> n | h::t -> h :: (helperAppend t n);;

let rec digitsOfInt n =
  if n <= 0 then [] else helperAppend (digitsOfInt (n / 10)) [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n <= 0 then [] else sumList (digitsOfInt n);;


(* fix

let rec helperAppend l n =
  match l with | [] -> n | h::t -> h :: (helperAppend t n);;

let rec digitsOfInt n =
  if n <= 0 then [] else helperAppend (digitsOfInt (n / 10)) [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = if n < 10 then 0 else sumList (digitsOfInt n);;

*)

(* changed spans
(11,6)-(11,12)
n < 10
BopG VarG LitG

(11,18)-(11,20)
0
LitG

*)

(* type error slice
(8,56)-(8,71)
(8,60)-(8,71)
(8,61)-(8,68)
(11,3)-(11,49)
(11,18)-(11,20)
(11,26)-(11,33)
(11,26)-(11,49)
*)
