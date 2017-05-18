
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f b), b);;

let g x = truncate (1e6 *. (cos (1e-6 *. (float x))));;

let _ = fixpoint (g, 0);;
