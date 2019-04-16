
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = sumList (digitsOfInt n);;

*)

(* changed spans
(7,33)-(7,54)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(5,56)-(5,71)
(5,60)-(5,71)
(5,61)-(5,68)
(7,33)-(7,40)
(7,33)-(7,54)
*)
