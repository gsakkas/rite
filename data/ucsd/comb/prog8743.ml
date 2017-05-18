
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, false) else (b, true)), b);;
