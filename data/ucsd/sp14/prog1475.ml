
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let _ =
  let fixpoint (f,b) = let b' = f b in if b' = b then b' else wwhile (f, b') in
  wwhile (f, b);;
