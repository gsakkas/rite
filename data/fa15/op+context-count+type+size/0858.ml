
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = if (n / 10) <= 0 then 0 else digits sumList n;;


(* fix

let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0 then 0 else sumList (digits n);;

*)

(* changed spans
(11,61)-(11,67)
(11,61)-(11,77)
(11,76)-(11,77)
*)

(* type error slice
(7,3)-(7,36)
(7,11)-(7,34)
(7,27)-(7,34)
(7,28)-(7,31)
(7,32)-(7,33)
(9,59)-(9,70)
(9,60)-(9,67)
(11,61)-(11,67)
(11,61)-(11,77)
(11,68)-(11,75)
*)
