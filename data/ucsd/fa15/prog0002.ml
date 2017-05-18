
let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let a = n mod 10 in
     let b = n / 10 in
     match b with
     | 0 -> if a = 0 then [] else (digitsOfInt b) @ [a]
     | x -> (digitsOfInt b) @ [a]);;

let _ = digitsOfInt - 34;;
