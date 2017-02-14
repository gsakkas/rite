
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
    if n < 10 then acc else count (acc + 1) sumList (digits n) in
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
    if n < 10 then acc else count (acc + 1) (sumList (digits n)) in
  count 0 n;;

*)

(* changed spans
(21,28)-(21,62)
(21,44)-(21,51)
*)

(* type error slice
(20,2)-(22,11)
(20,16)-(21,62)
(20,20)-(21,62)
(21,4)-(21,62)
(21,28)-(21,33)
(21,28)-(21,62)
*)
