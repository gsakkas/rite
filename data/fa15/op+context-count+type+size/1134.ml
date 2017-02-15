
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), ((not f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,29)-(5,53)
(5,30)-(5,35)
(5,31)-(5,32)
(5,33)-(5,34)
(5,38)-(5,47)
(5,39)-(5,42)
(5,45)-(5,46)
(5,50)-(5,51)
(5,55)-(5,56)
*)

(* type error slice
(5,38)-(5,47)
(5,39)-(5,42)
*)
