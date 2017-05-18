
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile b' c' else b';;
