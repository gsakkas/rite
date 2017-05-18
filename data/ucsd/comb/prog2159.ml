
let digitsOfInt n =
  if n < 0
  then []
  else
    (let rec digit n acc =
       if n < 10 then n :: acc else digit (n / 10) ((n mod 10) :: acc) in
     digit [] n);;
