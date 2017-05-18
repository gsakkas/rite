
let fixpoint (f,b) =
  let rec funt x = ((funt b), ((f b) = b)) in wwhile (funt, b);;
