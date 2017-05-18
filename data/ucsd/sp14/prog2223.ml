
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile
    ((let f f b =
        if ((f b) = (b, true)) && ((b, true) = ((f b) - 1)) then (b, false) in
      f), b);;
