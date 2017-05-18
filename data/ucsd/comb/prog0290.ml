
let rec wwhile (f,b) = let c' = f b in if c' = b then c' else wwhile (f, c');;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
