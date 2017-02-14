
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
(11,62)-(11,68)
(11,62)-(11,78)
(11,77)-(11,78)
*)

(* type error slice
(7,4)-(7,37)
(7,12)-(7,34)
(7,29)-(7,32)
(7,29)-(7,34)
(7,33)-(7,34)
(9,61)-(9,68)
(9,61)-(9,70)
(11,62)-(11,68)
(11,62)-(11,78)
(11,69)-(11,76)
*)
