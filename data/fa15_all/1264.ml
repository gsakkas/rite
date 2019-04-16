
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let x = digitsOfInt n in
  match x with
  | head -> 0
  | head::tail -> 1 + (additivePersistence sumList n);;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let x = digitsOfInt n in
  match x with
  | head -> 0
  | head::tail -> 1 + (additivePersistence (sumList x));;

*)

(* changed spans
(12,23)-(12,54)
additivePersistence (sumList x)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(8,4)-(12,56)
(8,29)-(12,54)
(9,3)-(12,54)
(10,3)-(12,54)
(11,13)-(11,14)
(12,23)-(12,54)
(12,24)-(12,43)
*)
