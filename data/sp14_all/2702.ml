
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else 1 + (additivePersistence sumList (digitsOfInt n));;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else 1 + (additivePersistence (sumList (digitsOfInt n)));;

*)

(* changed spans
(8,29)-(8,74)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(7,4)-(8,76)
(7,29)-(8,74)
(8,3)-(8,74)
(8,25)-(8,74)
(8,29)-(8,74)
(8,30)-(8,49)
*)
