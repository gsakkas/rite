
let rec wwhile (f,b) = match f b with | (b',c') -> if c' then f b' else b';;
