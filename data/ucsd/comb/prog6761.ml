
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun f'  -> fun x  -> (f, ((f x) = x))), b);;
