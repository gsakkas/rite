
let rec wwhile (f,b) = match b with | b -> wwhile (b, b);;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
