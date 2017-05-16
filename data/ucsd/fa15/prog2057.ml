
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

let digits n = digitsOfInt (abs n);;

let rec additivePersistence n = if (n / 10) <= 0 then 0 else digits n;;
