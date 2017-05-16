
let rec digitsOfInt n =
  let ns = [] in match n with | n -> (((n mod 10) :: ns) digitsOfInt n) / 10;;
