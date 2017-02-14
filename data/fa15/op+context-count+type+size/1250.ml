
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) =
  wwhile ((if (f b) = b then (b, false) else (b, true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(6,12)-(6,54)
(6,16)-(6,24)
(6,18)-(6,19)
(6,23)-(6,24)
(6,31)-(6,32)
(6,31)-(6,39)
(6,34)-(6,39)
(6,47)-(6,54)
(6,58)-(6,59)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,51)-(3,57)
(3,51)-(3,63)
(3,59)-(3,60)
(3,59)-(3,63)
(6,3)-(6,9)
(6,3)-(6,59)
(6,12)-(6,54)
(6,12)-(6,59)
(6,31)-(6,39)
*)
