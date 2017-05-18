
let rec clone x n n = List.append (clone x (n - 1)) [x];;
