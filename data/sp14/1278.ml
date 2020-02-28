
let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec lengthOfList xs count =
  match xs with | [] -> 0 | hd::tl -> (lengthOfList tl count) + 1;;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with
  | 0 -> 0
  | _ ->
      if not ((lengthOfList digitsOfInt n) = 1)
      then additivePersistence (sumList (digitsOfInt n))
      else 4;;


(* fix

let digitsOfInt n =
  let rec lastDigit n accu =
    if n <= 0 then accu else lastDigit (n / 10) ((n mod 10) :: accu) in
  match n with | _ -> lastDigit n [];;

let rec lengthOfList xs count =
  match xs with | [] -> 0 | hd::tl -> (lengthOfList tl count) + 1;;

let rec sumList xs = match xs with | [] -> 0 | hd::tl -> hd + (sumList tl);;

let rec additivePersistence n =
  match n with
  | 0 -> 0
  | _ ->
      if not ((lengthOfList (digitsOfInt n) 0) = 1)
      then additivePersistence (sumList (digitsOfInt n))
      else 4;;

*)

(* changed spans
(16,29)-(16,40)
digitsOfInt n
AppG [VarG]

(16,41)-(16,42)
0
LitG

*)

(* type error slice
(2,4)-(5,39)
(2,17)-(5,37)
(8,3)-(8,66)
(8,39)-(8,62)
(8,40)-(8,52)
(8,53)-(8,55)
(16,15)-(16,43)
(16,16)-(16,28)
(16,29)-(16,40)
*)
