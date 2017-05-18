
let rec clone x n =
  let acc = [x] in if n > 0 then clone (x :: acc) (n - 1) else [];;
