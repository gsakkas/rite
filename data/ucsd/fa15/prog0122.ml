
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let modded = n mod 10 in
     let quotient = n / 10 in
     let head = digitsOfInt quotient in head @ [modded]);;

let _ = digitsOfInt 1.5;;
