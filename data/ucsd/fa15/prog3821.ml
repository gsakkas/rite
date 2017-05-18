
let rec wwhile (f,b) = if f then f (f, b) else b;;
