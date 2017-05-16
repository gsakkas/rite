
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((let g x = if (f x) = b then f x else f (x + 1) in g 0), b);;
