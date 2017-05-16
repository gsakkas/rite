
let fixpoint (f,b) =
  let funt x = let xx = f f (f (f b)) in (xx, ((f b) = b)) in
  wwhile (funt, (f b));;
