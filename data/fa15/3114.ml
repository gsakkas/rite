
let rec additivePersistence n = if n < 10 then n else ();;


(* fix

let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence (sumList (digitsOfInt n));;

*)

(* changed spans
(2,35)-(2,41)
(2,54)-(2,56)
*)

(* type error slice
(2,32)-(2,56)
(2,35)-(2,36)
(2,35)-(2,41)
(2,39)-(2,41)
(2,47)-(2,48)
(2,54)-(2,56)
*)

(* all spans
(2,28)-(2,56)
(2,32)-(2,56)
(2,35)-(2,41)
(2,35)-(2,36)
(2,39)-(2,41)
(2,47)-(2,48)
(2,54)-(2,56)
*)
