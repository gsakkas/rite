
let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let rec digitsOfInt n =
  if n > 0 then (listReverse (n mod 10)) :: (digitsOfInt (n / 10)) else [];;


(* fix

let rec listReverse l =
  let rec listReverseHelper dec acc =
    match dec with | [] -> acc | h::t -> listReverseHelper t (h :: acc) in
  listReverseHelper l [];;

let rec digitsOfInt n =
  if n > 0 then listReverse ((n mod 10) :: (digitsOfInt (n / 10))) else [];;

*)

(* changed spans
(8,16)-(8,66)
(8,29)-(8,39)
*)

(* type error slice
(2,3)-(5,26)
(2,20)-(5,24)
(4,4)-(4,71)
(4,4)-(4,71)
(4,41)-(4,58)
(4,41)-(4,71)
(4,59)-(4,60)
(5,2)-(5,19)
(5,2)-(5,24)
(5,20)-(5,21)
(8,16)-(8,40)
(8,17)-(8,28)
(8,29)-(8,39)
*)
