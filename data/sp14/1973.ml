
let rec myAppend l n = match l with | [] -> [n] | h::t -> h :: (myAppend t n);;

let rec getDigits n =
  match n with | 0 -> [] | _ -> myAppend (getDigits (n / 10)) (n mod 10);;

let rec digitsOfInt n = if n = 0 then [0] else getDigits n;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  match n with | 0 -> 1 | _ -> 1 + (additivePersistence sumList digits n);;


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
(14,36)-(14,74)
additivePersistence (sumList (digits n))
AppG [AppG [EmptyG]]

*)

(* type error slice
(13,4)-(14,76)
(13,29)-(14,74)
(14,3)-(14,74)
(14,23)-(14,24)
(14,36)-(14,74)
(14,37)-(14,56)
*)
