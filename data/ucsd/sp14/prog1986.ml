
let g (f,x) = let xx = f x in (xx, (xx = (f x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g (f, b)), b);;
