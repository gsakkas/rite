
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let helper b = (((f b) = b), (f b)) in wwhile ((helper b), b);;
