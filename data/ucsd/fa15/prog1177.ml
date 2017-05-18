
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else f b';;
