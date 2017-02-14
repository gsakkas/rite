
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
(7,41)-(7,52)
*)

(* type error slice
(5,56)-(5,70)
(5,61)-(5,68)
(5,61)-(5,70)
(7,33)-(7,40)
(7,33)-(7,54)
*)
