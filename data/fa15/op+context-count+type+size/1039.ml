
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
(12,22)-(12,53)
(12,43)-(12,50)
(12,51)-(12,52)
*)

(* type error slice
(8,3)-(12,55)
(8,28)-(12,53)
(9,2)-(12,53)
(10,2)-(12,53)
(11,12)-(11,13)
(12,22)-(12,53)
(12,23)-(12,42)
*)
