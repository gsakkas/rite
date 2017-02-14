
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((b, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,29)-(5,45)
(5,30)-(5,31)
(5,37)-(5,38)
(5,42)-(5,43)
(5,47)-(5,48)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(5,21)-(5,27)
(5,21)-(5,49)
(5,28)-(5,49)
(5,29)-(5,45)
*)
