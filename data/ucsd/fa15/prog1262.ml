
let fixpointHelper f =
  match f with | (num,expr) -> if expr then (num, true) else (num, false);;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper f), b);;
