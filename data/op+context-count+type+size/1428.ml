
let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let rec digitsOfInt n =
  if n <= 0
  then []
  else listReverse ((n mod 10) :: (listReverse (digitsOfInt (n / 10))));;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (sumList (digitsOfInt n)) > 9 then sumList (digitsOfInt n);;


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
(13,3)-(13,63)
(13,41)-(13,48)
(13,41)-(13,63)
(13,50)-(13,63)
*)

(* type error slice
(8,49)-(8,60)
(8,49)-(8,68)
(8,62)-(8,68)
(10,22)-(10,70)
(10,61)-(10,68)
(10,61)-(10,70)
(10,69)-(10,70)
(13,3)-(13,63)
(13,16)-(13,27)
(13,16)-(13,29)
(13,28)-(13,29)
(13,41)-(13,48)
(13,41)-(13,63)
(13,50)-(13,61)
(13,50)-(13,63)
(13,62)-(13,63)
*)
