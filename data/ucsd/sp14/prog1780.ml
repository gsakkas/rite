
let rec wwhile (f,b) = let (a,b) = f b in if b then wwhile f a else a;;
