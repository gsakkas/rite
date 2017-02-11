
let wwhile (f,b) = let (func,boo) = f in func;;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
