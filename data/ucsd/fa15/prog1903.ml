
let rec wwhile (f,b) = let (x,y) = f b in if y then (wwhile f) * x else x;;
