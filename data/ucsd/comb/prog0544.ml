
let rec digitsOfInt n =
  if n <= 0
  then []
  else
    (let next_tail = digitsOfInt (n / 10) in
     match next_tail with | x::xs -> xs @ [x :: (n % 10)]);;
