
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let (x,y) = f b in (x, ((x <> b) && ((x, y) <> (f (b - 1)))))), b);;
