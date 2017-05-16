
let rec clone x n = if n = 1 then [x] else List.append [x] ((clone x n) - 1);;
