
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
(21,58)-(21,77)
count (acc + 1) n
AppG [BopG EmptyG EmptyG,VarG]

*)

(* type error slice
(20,3)-(22,12)
(20,17)-(21,77)
(20,21)-(21,77)
(21,58)-(21,69)
(21,58)-(21,77)
(21,59)-(21,64)
(21,72)-(21,77)
(21,73)-(21,74)
(22,3)-(22,8)
(22,3)-(22,12)
*)
