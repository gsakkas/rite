
let rec digitsOfInt n =
  if ((n mod 2) = 0) && (n > 0)
  then
    let rec loop input =
      if input < 10 then input else [loop (input / 10); input mod 10] in
    loop n
  else [];;
