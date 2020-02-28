
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  let rec counter c =
    if n < 10
    then c
    else counter (c + 1) additivePersistence (sumList (digits n)) in
  counter 0 n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then 0 else 1 + (additivePersistence (sumList (digits n)));;

*)

(* changed spans
(10,3)-(14,14)
if n < 10
then 0
else 1 + additivePersistence (sumList (digits n))
IteG (BopG EmptyG EmptyG) LitG (BopG EmptyG EmptyG)

*)

(* type error slice
(9,4)-(14,16)
(9,29)-(14,14)
(10,3)-(14,14)
(10,19)-(13,66)
(11,5)-(13,66)
(13,10)-(13,17)
(13,10)-(13,66)
(13,26)-(13,45)
(14,3)-(14,10)
(14,3)-(14,14)
(14,13)-(14,14)
*)
