
let rec sumListHelper total xs =
  match xs with | [] -> total | hd::tail -> sumListHelper (total + hd) tail;;

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else if n >= 10 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [n];;

let rec digitsOfInt n = digitsOfIntHelper n;;

let rec sumList xs = sumListHelper 0 xs;;

let rec additivePersistence n = sumList digitsOfInt n;;


(* fix

let rec sumListHelper total xs =
  match xs with | [] -> total | hd::tail -> sumListHelper (total + hd) tail;;

let rec digitsOfIntHelper n =
  if n < 1
  then []
  else if n >= 10 then (digitsOfIntHelper (n / 10)) @ [n mod 10] else [n];;

let rec digitsOfInt n = digitsOfIntHelper n;;

let rec sumList xs = sumListHelper 0 xs;;

let rec additivePersistence n = sumList (digitsOfInt n);;

*)

(* changed spans
(14,32)-(14,53)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

(14,40)-(14,51)
digitsOfInt n
AppG (fromList [VarG])

*)
