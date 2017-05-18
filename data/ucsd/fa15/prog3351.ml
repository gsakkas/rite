
let rec clone x n = match n with | 1 -> [x] | n' -> [clone x (n - 1)];;
