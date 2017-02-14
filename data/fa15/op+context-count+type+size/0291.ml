
let rec digitsOfIntHelper n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfIntHelper (n / 10));;

let rec listReverseHelper l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let rec digitsOfInt n = listReverseHelper (digitsOfIntHelper n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let rec count acc n =
    if (sumList (digits n)) mod (10 not 0) then acc else acc + 1 in
  count 1 n;;


(* fix

let rec digitsOfIntHelper n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfIntHelper (n / 10));;

let rec listReverseHelper l =
  let rec go i =
    function
    | [] -> i
    | headElement::tailList -> go (headElement :: i) tailList in
  go [] l;;

let rec digitsOfInt n = listReverseHelper (digitsOfIntHelper n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  let rec count acc n =
    if ((sumList (digits n)) mod 10) <> 0 then acc else acc + 1 in
  count 1 n;;

*)

(* changed spans
(21,9)-(21,42)
(21,34)-(21,42)
(21,37)-(21,40)
*)

(* type error slice
(21,5)-(21,65)
(21,9)-(21,42)
(21,34)-(21,36)
(21,34)-(21,42)
*)
