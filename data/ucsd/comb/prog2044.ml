
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' = if (f b) = b then (b, true) else (b, false) in wwhile (f', b);;
