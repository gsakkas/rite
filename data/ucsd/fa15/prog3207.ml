
let rec clone x n = if n = 0 then x else (clone x n) - 1;;

let _ = clone "foo" 2;;
