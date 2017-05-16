
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) = wwhile (((f b), (b = (f b))), b);;
