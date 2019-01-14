
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else additivePersistence sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if n < 10 then 1 else (additivePersistence (sumList (digitsOfInt n))) + 1;;

*)

(* changed spans
(8,24)-(8,43)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

(8,24)-(8,65)
additivePersistence (sumList (digitsOfInt n)) + 1
BopG (AppG (fromList [EmptyG])) LitG

(8,44)-(8,51)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

(8,52)-(8,63)
digitsOfInt n
AppG (fromList [VarG])

*)
