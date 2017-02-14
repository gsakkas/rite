
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((b, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,31)-(5,32)
(5,31)-(5,44)
(5,38)-(5,39)
(5,43)-(5,44)
(5,48)-(5,49)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,51)-(3,57)
(3,51)-(3,63)
(3,59)-(3,60)
(3,59)-(3,63)
(5,22)-(5,28)
(5,22)-(5,49)
(5,31)-(5,44)
(5,31)-(5,49)
*)
