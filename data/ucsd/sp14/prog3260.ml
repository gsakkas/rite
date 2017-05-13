
let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else ((helper x n) - (1 x)) :: acc in
  helper x n [];;
