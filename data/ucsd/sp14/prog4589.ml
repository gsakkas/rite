
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile
    ((let (x,y) = f b in
      if (x <> b) && (y = true) then (x, true) else if x = b then (x, false)),
      b);;
