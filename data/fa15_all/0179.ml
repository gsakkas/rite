
let rec digitsOfInt n =
  let rec helper n l = if n = 0 then l else helper (n / 10) ((n mod 10) :: l) in
  match n with | 0 -> [0] | _ -> helper n [];;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  if (List.length (digits n)) = 1
  then List.hd (digits n)
  else additivePersistence (digits n);;


(* fix

let rec digitsOfInt n =
  let rec helper n l = if n = 0 then l else helper (n / 10) ((n mod 10) :: l) in
  match n with | 0 -> [0] | _ -> helper n [];;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n =
  if (List.length (digits n)) = 1
  then List.hd (digits n)
  else additivePersistence (n / 10);;

*)

(* changed spans
(11,28)-(11,34)
n / 10
BopG VarG LitG

*)
