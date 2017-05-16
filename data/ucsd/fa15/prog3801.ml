
let rec digitsOfInt n =
  let numL = [] in if n > 0 then (n mod 10) :: (numL digitsOfInt n) else numL;;
