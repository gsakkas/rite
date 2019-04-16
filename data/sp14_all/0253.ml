
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9 then sumList [1; 2];;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9 then 0 else 1;;

*)

(* changed spans
(13,41)-(13,55)
0
LitG

(13,55)-(13,55)
1
LitG

*)

(* type error slice
(10,56)-(10,71)
(10,60)-(10,71)
(10,61)-(10,68)
(13,3)-(13,55)
(13,41)-(13,48)
(13,41)-(13,55)
(13,55)-(13,55)
*)
