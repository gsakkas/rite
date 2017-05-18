
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, y) else x;;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
