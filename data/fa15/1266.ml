
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
(6,49)-(6,63)
(6,50)-(6,57)
(6,58)-(6,62)
(9,2)-(13,55)
(9,10)-(9,21)
(10,2)-(13,55)
(10,8)-(10,9)
(13,43)-(13,54)
(13,44)-(13,51)
(13,52)-(13,53)
*)

(* all spans
(2,20)-(3,60)
(3,2)-(3,60)
(3,5)-(3,11)
(3,5)-(3,6)
(3,10)-(3,11)
(3,17)-(3,19)
(3,25)-(3,60)
(3,48)-(3,49)
(3,25)-(3,47)
(3,26)-(3,37)
(3,38)-(3,46)
(3,39)-(3,40)
(3,43)-(3,45)
(3,50)-(3,60)
(3,51)-(3,59)
(3,51)-(3,52)
(3,57)-(3,59)
(5,16)-(6,63)
(6,2)-(6,63)
(6,8)-(6,10)
(6,24)-(6,25)
(6,42)-(6,63)
(6,42)-(6,46)
(6,49)-(6,63)
(6,50)-(6,57)
(6,58)-(6,62)
(8,28)-(13,55)
(9,2)-(13,55)
(9,10)-(9,21)
(10,2)-(13,55)
(10,8)-(10,9)
(11,10)-(11,11)
(12,16)-(12,17)
(13,18)-(13,55)
(13,18)-(13,19)
(13,22)-(13,55)
(13,23)-(13,42)
(13,43)-(13,54)
(13,44)-(13,51)
(13,52)-(13,53)
*)
