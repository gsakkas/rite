
let rec clone x n = match n with | 0 -> [] | h::t -> x :: (clone x (n - 1));;
