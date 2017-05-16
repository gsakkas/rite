
let rec clone x n = let accum = [] in if n < 1 then [] else (clone x n) - 1;;
