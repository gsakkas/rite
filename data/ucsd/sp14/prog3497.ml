
let rec clone x n =
  let acc = [0] in if n > 0 then clone (x :: acc) (n - 1) else [];;
