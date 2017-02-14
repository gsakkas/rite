
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), ((not f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,32)-(5,33)
(5,32)-(5,35)
(5,32)-(5,52)
(5,34)-(5,35)
(5,40)-(5,43)
(5,40)-(5,47)
(5,46)-(5,47)
(5,51)-(5,52)
(5,56)-(5,57)
*)

(* type error slice
(5,40)-(5,43)
(5,40)-(5,47)
*)
