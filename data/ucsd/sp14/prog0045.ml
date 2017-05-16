
let rec wwhile (f,b) = let (b',c') = f b in if c' then f b' else b';;
