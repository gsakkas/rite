
let fixpoint (f,b) =
  let rec funt x = ((funt (f b)), ((f b) = b)) in wwhile (funt, b);;
