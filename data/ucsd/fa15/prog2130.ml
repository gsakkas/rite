
let fixpoint (f,b) =
  let isFPoint = ((f b) - b) < 0 in
  let rec test x = if isFPoint x then (x, true) else ((test x), false) in
  wwhile (isFPoint, b);;
