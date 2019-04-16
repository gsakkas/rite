
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0
  then n mod 10
  else additivePersistence sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) <= 0
  then n mod 10
  else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(10,8)-(10,49)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(7,4)-(10,51)
(7,29)-(10,49)
(8,3)-(10,49)
(10,8)-(10,27)
(10,8)-(10,49)
*)
