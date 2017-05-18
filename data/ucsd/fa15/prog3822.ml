
let rec wwhile (f,b) = if f then wwhile (f, b) else b;;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
