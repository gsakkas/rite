
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let fx b = ((f b), ((not f b) = b)) in wwhile (fx, b);;
