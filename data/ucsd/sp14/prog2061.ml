
let rec wwhile (f,b) = let (x,y) = f in if y = true then wwhile (f, x) else x;;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
