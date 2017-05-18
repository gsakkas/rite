
let rec clone x n = match n with | 0 -> [] | n -> x :: (clone (x (n - 1)));;
