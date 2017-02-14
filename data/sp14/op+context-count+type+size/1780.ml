
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
(11,5)-(11,11)
(11,10)-(11,11)
(11,17)-(11,19)
*)

(* type error slice
(8,55)-(8,70)
(8,59)-(8,70)
(8,60)-(8,67)
(11,2)-(11,48)
(11,2)-(11,48)
(11,17)-(11,19)
(11,25)-(11,32)
(11,25)-(11,48)
*)
