
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
(14,29)-(14,47)
sumList (digits n)
AppG [AppG [EmptyG]]

*)

(* type error slice
(10,56)-(10,71)
(10,60)-(10,71)
(10,61)-(10,68)
(14,29)-(14,47)
(14,30)-(14,37)
*)
