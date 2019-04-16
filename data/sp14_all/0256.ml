
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if (sumList (digitsOfInt n)) > 9
  then sumList (digitsOfInt (sumList (digitsOfInt n)));;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec digitalRoot n =
  if (sumList (digitsOfInt n)) > 9
  then sumList (digitsOfInt (sumList (digitsOfInt n)))
  else 0;;

*)

(* changed spans
(14,55)-(14,55)
0
LitG

*)

(* type error slice
(10,56)-(10,71)
(10,60)-(10,71)
(10,61)-(10,68)
(13,3)-(14,55)
(14,8)-(14,15)
(14,8)-(14,55)
(14,55)-(14,55)
*)
