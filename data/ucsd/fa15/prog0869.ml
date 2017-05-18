
let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

let fixpoint (f,b) = wwhile (((f b) = b), b);;
