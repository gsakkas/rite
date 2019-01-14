
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
sumList (digits n)
AppG (fromList [AppG (fromList [EmptyG])])

(14,37)-(14,43)
digits n
AppG (fromList [VarG])

*)
