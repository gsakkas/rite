
let rec additivePersistence n =
  match n with | [] -> [] | h::t -> h + (additivePersistence t);;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt (n / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else 1 + (additivePersistence (sumList (digitsOfInt n)));;

*)

(* changed spans
(3,3)-(3,64)
if n < 10
then 1
else 1 + additivePersistence (sumList (digitsOfInt n))
IteG (BopG EmptyG EmptyG) LitG (BopG EmptyG EmptyG)

*)

(* type error slice
(2,4)-(3,66)
(2,29)-(3,64)
(3,3)-(3,64)
(3,24)-(3,26)
(3,37)-(3,64)
(3,41)-(3,64)
(3,42)-(3,61)
*)
