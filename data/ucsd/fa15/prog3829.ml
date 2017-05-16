
let fixpointHelper (f,b) = if (f b) = b then (b, true) else (b, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper (f, b)), b);;
