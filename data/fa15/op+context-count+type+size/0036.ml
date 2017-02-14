
let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if ((sumList (digits n)) / 10) <> 0
  then (additivePersistence (sumList digits n)) + 1
  else 1;;


(* fix

let rec digitsOfInt n =
  let return = [n mod 10] in
  if (n / 10) <> 0
  then ((n mod 10) :: return; (digitsOfInt (n / 10)) @ return)
  else return;;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if ((sumList (digits n)) / 10) <> 0
  then (additivePersistence (sumList (digits n))) + 1
  else 1;;

*)

(* changed spans
(14,30)-(14,46)
(14,38)-(14,44)
*)

(* type error slice
(5,10)-(5,29)
(5,10)-(5,62)
(10,56)-(10,70)
(10,61)-(10,68)
(10,61)-(10,70)
(14,30)-(14,37)
(14,30)-(14,46)
*)
