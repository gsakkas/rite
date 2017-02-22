

let fst_of_3 (x, _, _) = x

let divmod n m =
  (n / m, n mod m)

let _ =
  fst_of_3 (divmod 14 5)
