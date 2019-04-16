
let rec additivePersistence n =
  if n > 0 then (n mod 10) + ((additivePersistence n) / 10);;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = sumList (digitsOfInt n);;

*)

(* changed spans
(3,3)-(3,60)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(3,3)-(3,60)
(3,17)-(3,60)
(3,60)-(3,60)
*)
