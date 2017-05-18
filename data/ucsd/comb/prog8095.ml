
let rec clone x n = match n with | 0 -> x | _ -> (clone x (n - 1)) :: x;;
