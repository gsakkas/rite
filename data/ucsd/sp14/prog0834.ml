
let fixpoint (f,b) = let b' = f b in if b' = b then b else (f, b');;
