
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
(13,2)-(13,54)
(13,40)-(13,47)
(13,40)-(13,54)
(13,48)-(13,54)
(13,52)-(13,53)
*)

(* type error slice
(10,55)-(10,70)
(10,59)-(10,70)
(10,60)-(10,67)
(13,2)-(13,54)
(13,2)-(13,54)
(13,2)-(13,54)
(13,40)-(13,47)
(13,40)-(13,54)
*)
