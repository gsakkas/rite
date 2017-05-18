
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then wwhile f b' else b';;
