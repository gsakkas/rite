
let rec digitsOfInt n =
  let returnList = [] in
  if n < 0 then [] else returnList @ ([1] digitsOfInt (n / 10));;
