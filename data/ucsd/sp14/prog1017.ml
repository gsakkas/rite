
let rec wwhile (f,b) = let (b',c') = f b in if b' then wwhile (f, b') else c';;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
