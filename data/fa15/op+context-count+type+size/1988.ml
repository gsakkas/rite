
let rec digitsOfInt n =
  if 0 >= n then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) != 0
  then 1 + (additivePersistence sumList (digitsOfInt n))
  else 0;;


(* fix

let rec digitsOfInt n =
  if 0 >= n then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) != 0
  then 1 + (additivePersistence (sumList (digitsOfInt n)))
  else 0;;

*)

(* changed spans
(9,13)-(9,55)
(9,33)-(9,40)
*)

(* type error slice
(7,4)-(10,11)
(7,29)-(10,9)
(8,3)-(10,9)
(9,8)-(9,55)
(9,13)-(9,32)
(9,13)-(9,55)
*)
