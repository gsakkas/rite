
let rec digitsOfInt n =
  let digit = n mod 10
  and r = n / 10 in
  match n with | _ when n <= 0 -> [] | _ when n > 0 -> [digitsOfInt r; digit];;
