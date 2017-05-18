
let rec wwhile (f,b) =
  match f b with | (bb,false ) -> bb | (bb,true ) -> wwhile (f, bb);;

let fixpoint (f,b) =
  wwhile
    ((fun b  -> ((f b), ((not ((f b) = b)) || (not ((f b) = (f (f b))))))),
      b);;

let pi = 4.0 *. (atan 1.0);;

let _ = fixpoint (sin, (4. * pi));;
