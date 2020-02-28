
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
0
LitG

(14,34)-(14,65)
let sum =
  num + additivePersistence num in
1 + additivePersistence num
LetG NonRec [(VarPatG,BopG EmptyG EmptyG)] (BopG EmptyG EmptyG)

*)

(* type error slice
(10,3)-(14,66)
(11,8)-(11,10)
(13,5)-(14,66)
(14,6)-(14,65)
(14,34)-(14,65)
*)
