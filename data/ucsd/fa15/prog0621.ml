
let rec wwhile (f,b) =
  let (x,y) = f b in if y = false then x else wwhile (f, x);;

let fixpoint (f,b) = wwhile ((f b), b);;

let _ =
  let g x = truncate (1e6 *. (cos (1e-6 *. (float x)))) in fixpoint (g, 0);;
