
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, false) else ((f b), true)), b);;
