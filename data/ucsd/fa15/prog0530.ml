
let rec digitsOfInt n =
  if n <= 0
  then []
  else (let x = n mod 10
        and n = n / 10 in (digitsOfInt n) @ [x]);;

let rec additivePersistence n = if n >= 10 then digitsOfInt n;;
