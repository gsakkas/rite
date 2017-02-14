
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then 0
  else
    (let myList = digits n in
     let num = sumList n in num + (additivePersistence num));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then 0
  else
    (let myList = digits n in
     let num = sumList myList in num + (additivePersistence num));;

*)

(* changed spans
(14,23)-(14,24)
*)

(* type error slice
(7,21)-(7,70)
(7,21)-(7,70)
(7,59)-(7,70)
(7,60)-(7,67)
(7,68)-(7,69)
(10,5)-(10,6)
(10,5)-(10,11)
(10,5)-(10,11)
(10,9)-(10,11)
(14,15)-(14,22)
(14,15)-(14,24)
(14,23)-(14,24)
*)
