
let rec clone x n = [clone x (n - 1); x];;
