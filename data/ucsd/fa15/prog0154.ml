
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> b = (f b)), b);;
