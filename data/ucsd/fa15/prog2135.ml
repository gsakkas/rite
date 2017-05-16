
let fixpoint (f,b) =
  let gs x =
    let isFPoint x = ((f x) - x) < 0 in
    let iterate (t,y) = t y in
    let rec go r = if isFPoint r then r else go (iterate (x, r)) in go x in
  wwhile (gs, b);;
