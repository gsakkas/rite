
let rec additivePersistence n = if n < 10 then n else ();;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(2,55)-(2,57)
additivePersistence (sumList (digitsOfInt n))
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(2,33)-(2,57)
(2,36)-(2,37)
(2,36)-(2,42)
(2,40)-(2,42)
(2,48)-(2,49)
(2,55)-(2,57)
*)
