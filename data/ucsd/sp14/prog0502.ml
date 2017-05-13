
let rec digitalRoot n =
  let rec helper x = if x < 10 then x else helper sumList digits x in
  helper n;;
