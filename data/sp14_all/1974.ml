
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  match n with | 0 -> 1 | _ -> 1 + (additivePersistence (sumList digits n));;


(* fix

let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  match n with | 0 -> 1 | _ -> 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(14,57)-(14,75)
sumList (digits n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(11,56)-(11,71)
(11,60)-(11,71)
(11,61)-(11,68)
(14,57)-(14,75)
(14,58)-(14,65)
*)
