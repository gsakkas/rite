
let rec clone x n =
  let acc = [] in if n = 0 then acc else (clone x) :: ((acc n) - 1);;
