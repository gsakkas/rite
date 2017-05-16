
let rec digitsOfInt n =
  if n > 0 then (digitsOfInt ((n - (n mod 10)) / 10)) @ [n mod 10] else [];;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let rec additivePersistence n =
  if n < 10 then n else additivePersistence sumList digitsOfInt n;;
