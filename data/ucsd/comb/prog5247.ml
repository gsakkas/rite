
let rec wwhile (f,b) =
  let i = b in
  match f i with | (v_n,false ) -> v_n | (v_n,true ) -> wwhile (f, v_n);;

let fixpoint (f,b) = wwhile (f, b);;

let _ =
  let g x = truncate (1e6 *. (cos (1e-6 *. (float x)))) in fixpoint (g, 0);;
