
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((let g x = f b in ((f b), ((f b) = b))), b);;
