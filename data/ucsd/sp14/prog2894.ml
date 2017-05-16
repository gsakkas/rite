
let rec wwhile (f,b) = match f with | (x,y) -> if y = true then wwhile (f, x);;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
