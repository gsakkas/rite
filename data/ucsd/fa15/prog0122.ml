
let rec append l r = match l with | [] -> r | h::t -> h :: (append t r);;

let rec digitsOfInt n =
  if (n >= 0) && (n < 10)
  then [n]
  else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  if (n >= 0) && (n < 10)
  then 0
  else 1 + (additivePersistence (sumList (digits n)));;

let _ = additivePersistence 9.9;;
