
let rec wwhile (f,b) =
  match f with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let _ = let f x = let xx = (x * x) * x in (xx, (xx < 100)) in wwhile (f, 2);;
