
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
(11,11)-(11,12)
(11,18)-(11,20)
*)

(* type error slice
(8,56)-(8,70)
(8,61)-(8,68)
(8,61)-(8,70)
(11,3)-(11,48)
(11,3)-(11,48)
(11,18)-(11,20)
(11,26)-(11,33)
(11,26)-(11,48)
*)
