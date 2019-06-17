
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (match n with
     | 0 -> [0]
     | _ ->
         if (n / 10) != 0
         then (digitsOfInt (n / 10)) @ [n mod 10]
         else [n mod 10]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList digitsOfInt n) < 9
  then 0
  else 1 + (additivePersistence sumList n);;


(* fix

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (match n with
     | 0 -> [0]
     | _ ->
         if (n / 10) != 0
         then (digitsOfInt (n / 10)) @ [n mod 10]
         else [n mod 10]);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) < 9
  then 0
  else 1 + (additivePersistence (sumList (digitsOfInt n)));;

*)

(* changed spans
(16,6)-(16,29)
sumList (digitsOfInt n)
AppG [AppG [EmptyG]]

(18,12)-(18,43)
additivePersistence (sumList (digitsOfInt n))
AppG [AppG [EmptyG]]

*)

(* type error slice
(13,56)-(13,71)
(13,60)-(13,71)
(13,61)-(13,68)
(15,4)-(18,45)
(15,29)-(18,43)
(16,3)-(18,43)
(16,6)-(16,29)
(16,7)-(16,14)
(18,8)-(18,43)
(18,12)-(18,43)
(18,13)-(18,32)
*)
