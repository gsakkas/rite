
let rec wwhile (f,b) =
  let f' = f b in
  match f' with | (b',false ) -> b' | (b',true ) -> wwhile (f, b');;

let fixpoint (f,b) = wwhile (f, b);;

let g x = truncate (1e6 *. (cos (1e-6 *. (float x))));;

let _ = fixpoint (g, 0);;
