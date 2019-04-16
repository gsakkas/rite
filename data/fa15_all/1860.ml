
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
(21,29)-(21,63)
count (acc + 1)
      (sumList (digits n))
AppG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(20,3)-(22,12)
(20,17)-(21,63)
(20,21)-(21,63)
(21,5)-(21,63)
(21,29)-(21,34)
(21,29)-(21,63)
*)
