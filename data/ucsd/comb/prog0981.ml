
let rec digitsOfInt n =
  if n < 0
  then []
  else if n >= 10 then (digitsOfInt (n / 10)) @ [n mod 10] else [n];;

let digits n = digitsOfInt (abs n);;

let rec sumList xs = match xs with | [] -> 0 | x::xs -> x + (sumList xs);;

let rec additivePersistence (a,n) =
  let intFun (a,n) =
    if n < 10
    then (a, n)
    else additivePersistence ((a + 1), (sumList (digits n))) in
  4;;
