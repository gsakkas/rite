
let rec clone x n =
  let acc = [] in if x = 0 then acc else acc :: ((clone x n) - 1);;
