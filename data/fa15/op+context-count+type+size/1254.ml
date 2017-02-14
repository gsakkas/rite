
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), (not ((f b) = b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,32)-(5,33)
(5,32)-(5,35)
(5,32)-(5,53)
(5,34)-(5,35)
(5,39)-(5,42)
(5,39)-(5,53)
(5,47)-(5,48)
(5,52)-(5,53)
(5,58)-(5,59)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,51)-(3,57)
(3,51)-(3,63)
(3,59)-(3,60)
(3,59)-(3,63)
(5,22)-(5,28)
(5,22)-(5,59)
(5,32)-(5,53)
(5,32)-(5,59)
*)
