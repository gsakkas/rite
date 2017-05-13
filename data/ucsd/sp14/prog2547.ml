
let fixpoint (f,b) =
  let g x = let xx = f x in (xx, (xx = x)) in g wwhile (g, b);;
