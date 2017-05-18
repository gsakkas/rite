
let rec digitsOfInt n =
  if 0 >= n then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n / 10) != 0
  then 1 + (additivePersistence sumList (digitsOfInt n))
  else 0;;
