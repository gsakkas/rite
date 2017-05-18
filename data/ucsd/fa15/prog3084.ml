
let helper (f,a,y) =
  let x = f a in if x = y then ((f, x, y), false) else ((f, x, y), true);;

let rec wwhile (f,b) =
  let (b',c') = f b in
  match c' with | false  -> (b', c') | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile ((helper (f, b, b)), b);;
