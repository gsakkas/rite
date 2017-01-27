
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
(6,40)-(6,51)
(6,40)-(6,59)
(6,53)-(6,59)
(8,22)-(8,70)
(8,61)-(8,68)
(8,61)-(8,70)
(8,69)-(8,70)
(11,3)-(11,48)
(11,6)-(11,7)
(11,6)-(11,12)
(11,11)-(11,12)
(11,18)-(11,20)
(11,26)-(11,33)
(11,26)-(11,48)
(11,35)-(11,46)
(11,35)-(11,48)
(11,47)-(11,48)
*)
