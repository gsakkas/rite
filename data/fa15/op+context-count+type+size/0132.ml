
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
(11,27)-(11,37)
(11,28)-(11,34)
*)

(* type error slice
(6,3)-(6,36)
(6,11)-(6,34)
(6,27)-(6,34)
(6,28)-(6,31)
(6,32)-(6,33)
(8,3)-(11,39)
(8,28)-(11,37)
(9,18)-(9,28)
(9,19)-(9,25)
(9,26)-(9,27)
(10,7)-(10,14)
(10,7)-(10,25)
(10,15)-(10,25)
(10,16)-(10,22)
(11,7)-(11,26)
(11,7)-(11,37)
(11,27)-(11,37)
(11,28)-(11,34)
*)
