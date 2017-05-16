
let fixpointHelper (f,b) = f;;

let rec wwhile (f,b) =
  match f b with | (num,expr) -> if expr then wwhile (f, num) else num;;

let fixpoint (f,b) = wwhile ((fixpointHelper (f, b)), b);;

let _ =
  let g x = truncate (1e6 *. (cos (1e-6 *. (float x)))) in fixpoint (g, 0);;
