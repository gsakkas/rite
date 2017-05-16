
let rec clone x n = if n = 1 then [] @ x else (clone [x]) :: ((x n) - 1);;
