
let rec intToReverseList n =
  if n <= 0 then [] else (n mod 10) :: (intToReverseList (n / 10));;

let rec listReverseHelper l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let rec digitsOfInt n = listReverseHelper (intToReverseList n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let rec count acc n =
    if ((sumList (digits n)) / 10) = 0 then acc + 1 else (count acc) + (1 n) in
  count 0 n;;


(* fix

let rec intToReverseList n =
  if n <= 0 then [] else (n mod 10) :: (intToReverseList (n / 10));;

let rec listReverseHelper l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let rec digitsOfInt n = listReverseHelper (intToReverseList n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let rec count acc n =
    if ((sumList (digits n)) / 10) = 0 then acc + 1 else count (acc + 1) n in
  count 0 n;;

*)

(* changed spans
(21,57)-(21,68)
(21,57)-(21,76)
(21,64)-(21,67)
(21,71)-(21,76)
*)

(* type error slice
(20,2)-(22,11)
(20,16)-(21,76)
(20,20)-(21,76)
(21,57)-(21,68)
(21,57)-(21,76)
(21,58)-(21,63)
(21,71)-(21,76)
(21,72)-(21,73)
(22,2)-(22,7)
(22,2)-(22,11)
*)
