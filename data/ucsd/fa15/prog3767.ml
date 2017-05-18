
let rec helper (x,n) = match n with | 0 -> [] | _ -> [helper (x, (n - 1)); x];;
