(*F*)
let compare d (x,y) = x - d >= y

let f (n, m) (d, e) =
  let square x = x * x in
  let rec fac x = if x = 0 then 1 else fac (x-1) in
  let x = square n in
  let y = fac (n / m) in
  if x > y then
    compare d n m
  else
    compare e (n,m)
