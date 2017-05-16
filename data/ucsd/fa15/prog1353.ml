
let rec digitsOfInt n =
  if n < 0 then print_int 0 else (print_int n) / 10; digitsOfInt (n / 10);;
