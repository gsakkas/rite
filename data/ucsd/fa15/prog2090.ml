
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fx = match f b with | b -> b in wwhile (fx, b);;

let _ =
  let g x = truncate (1e6 *. (cos (1e-6 *. (float x)))) in fixpoint (g, 0);;
