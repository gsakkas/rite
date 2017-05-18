
let rec wwhile (f,b) = if b then wwhile (f, b) else f;;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
