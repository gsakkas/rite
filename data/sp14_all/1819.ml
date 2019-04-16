
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
(14,24)-(14,25)
myList
VarG

*)

(* type error slice
(7,22)-(7,71)
(7,60)-(7,71)
(7,61)-(7,68)
(7,69)-(7,70)
(10,6)-(10,7)
(10,6)-(10,12)
(10,10)-(10,12)
(14,16)-(14,23)
(14,16)-(14,25)
(14,24)-(14,25)
*)
