
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
(10,2)-(14,13)
(10,18)-(13,65)
(12,9)-(12,10)
(13,9)-(13,16)
(13,9)-(13,65)
(13,18)-(13,19)
(13,25)-(13,44)
(14,2)-(14,13)
*)

(* type error slice
(9,3)-(14,15)
(9,28)-(14,13)
(10,2)-(14,13)
(10,18)-(13,65)
(11,4)-(13,65)
(13,9)-(13,16)
(13,9)-(13,65)
(13,25)-(13,44)
(14,2)-(14,9)
(14,2)-(14,13)
(14,12)-(14,13)
*)
