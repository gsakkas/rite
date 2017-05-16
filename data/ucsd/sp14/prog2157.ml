
let digitsOfInt n =
  if n < 0
  then []
  else
    (let rec digit n acc =
       if n < 10 then n :: acc else digit ((n mod 10) :: acc) (n / 10) in
     digit [] n);;
