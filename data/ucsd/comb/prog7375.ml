
let rec digitsOfInt n =
  let rec dig acc d =
    if d < 10 then d :: acc else dig ((d mod 10) :: acc) (d div 10) in
  dig [] d;;
