
let fixpointHelper f b =
  let c = f b in if c = b then (c, true) else (c, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f b), b);;
