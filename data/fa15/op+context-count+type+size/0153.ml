
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
(11,29)-(11,35)
(11,29)-(11,37)
*)

(* type error slice
(6,4)-(6,37)
(6,12)-(6,34)
(6,29)-(6,32)
(6,29)-(6,34)
(6,33)-(6,34)
(8,4)-(11,40)
(8,29)-(11,37)
(9,20)-(9,26)
(9,20)-(9,28)
(9,27)-(9,28)
(10,8)-(10,15)
(10,8)-(10,25)
(10,17)-(10,23)
(10,17)-(10,25)
(11,8)-(11,27)
(11,8)-(11,37)
(11,29)-(11,35)
(11,29)-(11,37)
*)
