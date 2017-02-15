
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
(9,10)-(9,21)
(10,2)-(13,55)
*)

(* type error slice
(3,25)-(3,47)
(3,26)-(3,37)
(6,2)-(6,63)
(6,2)-(6,63)
(6,49)-(6,63)
(6,50)-(6,57)
(6,58)-(6,62)
(9,2)-(13,55)
(9,10)-(9,21)
(10,2)-(13,55)
(10,2)-(13,55)
(10,2)-(13,55)
(10,2)-(13,55)
(10,2)-(13,55)
(10,2)-(13,55)
(10,8)-(10,9)
(13,43)-(13,54)
(13,44)-(13,51)
(13,52)-(13,53)
*)
