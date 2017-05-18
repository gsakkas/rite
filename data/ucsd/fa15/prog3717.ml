
let rec clone x n = if n = 0 then x else (let c = x :: x in clone x (n - 1));;
