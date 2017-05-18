
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let b' = f b in let f' = (b', (b == b')) in wwhile (f', b);;
