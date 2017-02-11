
let rec wwhile (f,b) =
  let c' = f b in let b' = b in if c' = b then c' else wwhile (c', b');;
