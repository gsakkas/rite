
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else n = (n - (n mod 10)); (n :: myList) :: digitsOfInt;;
