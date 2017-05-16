
let rec digitsOfInt n =
  let myList = [] in
  if n <= 0 then [] else (n mod 10) :: ((myList n) mod 100) :: myList;;
