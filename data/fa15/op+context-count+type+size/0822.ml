
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n <= 0
  then []
  else if n < 10 then 0 else 1 + (additivePersistence sumList (digits n));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(10,6)-(10,7)
(10,6)-(10,12)
(10,11)-(10,12)
(11,8)-(11,10)
(12,8)-(12,72)
(12,35)-(12,72)
(12,55)-(12,62)
*)

(* type error slice
(9,4)-(12,76)
(9,29)-(12,72)
(10,3)-(12,72)
(10,3)-(12,72)
(11,8)-(11,10)
(12,8)-(12,72)
(12,23)-(12,24)
(12,35)-(12,54)
(12,35)-(12,72)
*)
