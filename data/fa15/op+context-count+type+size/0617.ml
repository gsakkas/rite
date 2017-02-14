
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
(7,32)-(7,53)
(7,40)-(7,51)
*)

(* type error slice
(5,55)-(5,70)
(5,59)-(5,70)
(5,60)-(5,67)
(7,32)-(7,39)
(7,32)-(7,53)
*)
