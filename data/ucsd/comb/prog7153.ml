
let fp f b = let (i,t) = f b in if i = b then b;;

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) = wwhile ((fp f b), b);;
