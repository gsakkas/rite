
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
(6,10)-(6,55)
(6,14)-(6,23)
(6,17)-(6,18)
(6,22)-(6,23)
(6,29)-(6,39)
(6,30)-(6,31)
(6,33)-(6,38)
(6,45)-(6,54)
(6,57)-(6,58)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(6,2)-(6,8)
(6,2)-(6,59)
(6,9)-(6,59)
(6,10)-(6,55)
(6,29)-(6,39)
*)
