
let rec clone x n =
  let acc = [] in if n > 0 then clone (x :: x) (n - 1) else [];;
