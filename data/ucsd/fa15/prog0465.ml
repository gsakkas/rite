
let rec digitsOfIntHelper n =
  if n <= 0 then [] else (n mod 10) :: (digitsOfIntHelper (n / 10));;

let rec digitsOfInt n = List.rev (digitsOfIntHelper n);;

let digits n = digitsOfInt (abs n);;

let rec sumList xs =
  match xs with | [] -> 0 | head::tail -> head + (sumList tail);;

let rec additivePersistence n =
  if ((sumList digits n) / 10) = 0
  then sumList digits n
  else additivePersiste;;
