
let fixpoint (f,b) = let fx b = ((f b), ((not f b) = b)) in wwhile (fx, b);;
