
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence sumList digitsOfInt n;;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(8,24)-(8,65)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

(8,44)-(8,51)
sumList (digitsOfInt n)
AppG (fromList [AppG (fromList [EmptyG])])

(8,52)-(8,63)
digitsOfInt n
AppG (fromList [VarG])

*)
