
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | true  -> wwhile (f, b');;

let fixpoint (f,b) = wwhile (f, b);;

let g x = truncate (1e6 *. (cos (1e-6 *. (float x))));;

let _ = fixpoint (g, 0);;
