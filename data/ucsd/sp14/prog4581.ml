
let rec wwhile (f,b) =
  match f with | (x,true ) -> wwhile (f x) | (x,false ) -> x;;
