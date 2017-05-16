
let digitsOfInt n =
  let rec digitsHelper n l = if n = 0 then l else (((n / 10) n) mod 10) :: l in
  if n <= 0 then [] else digitsHelper n [];;
