
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
  else 1 + (additivePersistence (sumList n));;


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
(18,41)-(18,42)
*)

(* type error slice
(10,14)-(10,36)
(10,15)-(10,26)
(10,27)-(10,35)
(13,21)-(13,70)
(13,21)-(13,70)
(13,59)-(13,70)
(13,60)-(13,67)
(13,68)-(13,69)
(16,14)-(16,29)
(16,15)-(16,26)
(16,27)-(16,28)
(18,32)-(18,43)
(18,33)-(18,40)
(18,41)-(18,42)
*)
