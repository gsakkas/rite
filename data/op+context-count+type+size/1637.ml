
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
(8,18)-(8,65)
(8,31)-(8,39)
*)

(* type error slice
(2,4)-(5,27)
(2,21)-(5,25)
(4,5)-(4,71)
(4,5)-(4,71)
(4,42)-(4,59)
(4,42)-(4,71)
(4,60)-(4,61)
(5,3)-(5,20)
(5,3)-(5,25)
(5,21)-(5,22)
(8,18)-(8,29)
(8,18)-(8,39)
(8,31)-(8,39)
*)
