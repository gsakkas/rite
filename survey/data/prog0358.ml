(* `wwhile (f, x)` returns x' where there exist values
   v_0,...,v_n such that:

   - x is equal to v_0
   - x' is equal to v_n
   - for each i between 0 and n-2, we have
     f v_i equals (v_i+1, true)
   - f v_n-1 equals (v_n, false) *)

let f x =
  let xx = x * x in
  (xx, (xx < 100))

let rec wwhile (f,b) =
  match f with
  | (z, false) -> z
  | (z, true)  -> wwhile (f, z)

let _ = wwhile (f, 2)
