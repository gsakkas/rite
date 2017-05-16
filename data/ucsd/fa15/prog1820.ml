
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f1 f2 x = if (f2 x) = x then false else true in wwhile ((f1 f), b);;
