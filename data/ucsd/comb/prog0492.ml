
let rec digits (x,y) =
  if y < 10 then y :: x else digits (((y mod 10) :: x), (y mod 10));;

let rec digitsOfInt n = if n <= 0 then [] else digits ([], n);;

let digits n = digitsOfInt (abs n);;

let rec digitsOfInt n = if n <= 0 then [] else digits ([], n);;
