
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
(14,28)-(14,46)
(14,37)-(14,43)
*)

(* type error slice
(5,7)-(5,62)
(5,8)-(5,28)
(10,55)-(10,70)
(10,59)-(10,70)
(10,60)-(10,67)
(14,28)-(14,46)
(14,29)-(14,36)
*)
