
let rec wwhile (f,b) =
  let (value,result) = f b in if not result then value else wwhile (f, value);;

let fixpoint (f,b) =
  wwhile ((let func (output,result) = ((f b), ((f b) = b)) in func), b);;

let _ =
  let g x = truncate (1e6 *. (cos (1e-6 *. (float x)))) in fixpoint (g, 0);;
