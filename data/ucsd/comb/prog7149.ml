
let rec wwhile (f,b) = if f b then f (f, b) else 1;;
