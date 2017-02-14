
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else [digitsOfInt (n mod 10); digitsOfInt (n / 10)];;


(* fix

let rec digitsOfInt n =
  let myList = [] in
  if n <= 0
  then []
  else if n < 10 then [n] else (digitsOfInt (n / 10)) @ [n mod 10];;

*)

(* changed spans
(4,25)-(4,71)
(4,26)-(4,37)
(4,26)-(4,48)
(4,38)-(4,48)
(4,39)-(4,40)
(4,50)-(4,70)
*)

(* type error slice
(2,3)-(4,73)
(2,20)-(4,71)
(3,2)-(4,71)
(4,2)-(4,71)
(4,25)-(4,71)
(4,25)-(4,71)
(4,50)-(4,61)
(4,50)-(4,70)
*)
