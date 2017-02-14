
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10
  then []
  else
    (let myList = digits n in
     let num = sumList myList in num + (additivePersistence num));;


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
     let num = sumList myList in
     let sum = num + (additivePersistence num) in
     1 + (additivePersistence num));;

*)

(* changed spans
(11,8)-(11,10)
(14,34)-(14,64)
*)

(* type error slice
(9,4)-(14,68)
(9,29)-(14,64)
(10,3)-(14,64)
(10,3)-(14,64)
(11,8)-(11,10)
(13,6)-(14,64)
(14,6)-(14,64)
(14,34)-(14,64)
(14,34)-(14,64)
(14,41)-(14,60)
(14,41)-(14,64)
*)
