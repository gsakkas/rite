
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (fun x  -> (((f x), (not ((f x) = x))), b));;
