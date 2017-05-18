
let rec digitsOfInt n =
  if n < 0
  then []
  else
    if n = 0
    then 0
    else (let x = n mod 10
          and r = n / 10 in (digitsOfInt r) @ [x]);;
