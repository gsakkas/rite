
let fixpoint (f,b) =
  let isFPoint x = ((f x) - x) < 0 in
  let rec test x = if isFPoint x then (x, true) else ((test (f b)), false) in
  wwhile (isFPoint, b);;
