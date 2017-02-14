
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let x = digitsOfInt in
  match x with
  | [] -> 0
  | head::[] -> 0
  | head::tail -> 1 + (additivePersistence (sumList x));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let x = digitsOfInt n in
  match x with
  | [] -> 0
  | head::[] -> 0
  | head::tail -> 1 + (additivePersistence (sumList x));;

*)

(* changed spans
(9,11)-(9,22)
(10,3)-(13,54)
*)

(* type error slice
(3,27)-(3,38)
(3,27)-(3,46)
(6,3)-(6,63)
(6,3)-(6,63)
(6,51)-(6,58)
(6,51)-(6,63)
(6,59)-(6,63)
(9,3)-(13,54)
(9,11)-(9,22)
(10,3)-(13,54)
(10,3)-(13,54)
(10,3)-(13,54)
(10,3)-(13,54)
(10,3)-(13,54)
(10,3)-(13,54)
(10,9)-(10,10)
(13,45)-(13,52)
(13,45)-(13,54)
(13,53)-(13,54)
*)
