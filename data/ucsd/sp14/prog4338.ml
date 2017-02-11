
let rec clone x n = match n with | 0 -> [] | 1 -> [clone x (n - 1); x];;
