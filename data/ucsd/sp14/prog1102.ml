
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile f b';;
