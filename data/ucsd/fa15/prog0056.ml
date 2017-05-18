
let rec digitsOfInt n =
  let returnList = [] in
  if n < 0 then [] else returnList @ ((n mod 10) digitsOfInt (n /. 10));;
