
let rec wwhile (f,b) = if f == b then b else 0;;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
