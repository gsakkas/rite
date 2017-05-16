
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | t::h -> t + (sumList h);;

let rec additivePersAndRoot xs pers =
  if (sumList xs) < 10
  then (pers, (sumList xs))
  else additivePersAndRoot digits (sumList xs) (pers + 1);;
