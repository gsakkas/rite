
let rec clone x n = match n with | 0 -> [] | _ -> [clone x];;
