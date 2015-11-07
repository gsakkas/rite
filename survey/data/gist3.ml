let rec digitsOfInt n =
  if n < 1 
  then []
  else (digitsOfInt (n / 10)) @ [n mod 10]

let digits n = digitsOfInt (abs n)

let rec sumList xs = match xs with 
  | [] -> 0 
  | h::t -> h + (sumList t)

let rec additivePersistence n =
  if sumList (digitsOfInt (digits n)) < 10
  then n
  else additivePersistence (sumList (digitsOfInt (digits n)))
