
let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) digitsOfInt 0 else return;;
