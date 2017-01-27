
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
(18,42)-(18,43)
*)

(* type error slice
(10,16)-(10,27)
(10,16)-(10,35)
(10,29)-(10,35)
(13,22)-(13,70)
(13,61)-(13,68)
(13,61)-(13,70)
(13,69)-(13,70)
(16,16)-(16,27)
(16,16)-(16,29)
(16,28)-(16,29)
(18,34)-(18,41)
(18,34)-(18,43)
(18,42)-(18,43)
*)
