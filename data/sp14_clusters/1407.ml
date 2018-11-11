
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
(16,5)-(16,28)
sumList (digitsOfInt n)
AppG [AppG [EmptyG]]

(16,14)-(16,25)
digitsOfInt n
AppG [VarG]

(18,11)-(18,42)
additivePersistence (sumList (digitsOfInt n))
AppG [AppG [EmptyG]]

(18,32)-(18,39)
sumList (digitsOfInt n)
AppG [AppG [EmptyG]]

(18,40)-(18,41)
digitsOfInt
VarG

(18,40)-(18,41)
digitsOfInt n
AppG [VarG]

*)
