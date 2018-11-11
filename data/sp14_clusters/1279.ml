
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
      if not ((lengthOfList (digitsOfInt n)) = 1)
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
(16,14)-(16,44)
lengthOfList (digitsOfInt n) 0
AppG [AppG [EmptyG],LitG]

(16,47)-(16,48)
0
LitG

*)
