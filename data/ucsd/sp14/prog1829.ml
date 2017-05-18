
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let f x = (x * x) * x in ((xx, (xx < 512)), b));;
