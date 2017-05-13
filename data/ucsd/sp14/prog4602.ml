
let rec clone x n =
  let acc = [] in if n > 0 then clone (x :: acc) (n - 1) else [];;
