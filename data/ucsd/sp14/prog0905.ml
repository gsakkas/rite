
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile (fun x  -> if x = (f x) then (x, false) else (((f x), true), b));;
