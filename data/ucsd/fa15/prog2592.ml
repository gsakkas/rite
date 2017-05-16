
let rec wwhile (f,b) =
  let (b',c) = f b in if not c then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f b), b);;

let _ =
  let g x = truncate (1e6 *. (cos (1e-6 *. (float x)))) in fixpoint (g, 0);;
