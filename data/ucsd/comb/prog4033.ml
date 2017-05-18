
let rec getFirst n = if n < 10 then n else getFirst (n / 10);;

let x = 9800;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n < 10
    then [n]
    else
      (let head = getFirst n
       and s = String.length (string_of_int n)
       and rest = (float_of_int n) - (1. * (10. ** (float_of_int s))) in
       if (x = 0) && (y = 0) then [] else y :: (digitsOfInt x));;
