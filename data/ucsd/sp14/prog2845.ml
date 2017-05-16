
let rec digitsOfInt n =
  let myList = [] in if n <= 0 then [] else [digitsOfInt (n mod 10)];;
