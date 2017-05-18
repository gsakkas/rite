
let rec digitsOfInt n =
  let numL = [] in if n > 0 then ((digitsOfInt n) mod 10) :: numL else numL;;
