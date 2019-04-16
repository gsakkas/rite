
let rec additivePersistence n = n = (additivePersistence (n mod 10));;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n = additivePersistence (sumList (digits n));;

*)

(* changed spans
(2,33)-(2,69)
additivePersistence (sumList (digits n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(2,71)
(2,29)-(2,69)
(2,33)-(2,34)
(2,33)-(2,69)
(2,37)-(2,69)
(2,38)-(2,57)
(2,58)-(2,68)
(2,59)-(2,60)
*)
