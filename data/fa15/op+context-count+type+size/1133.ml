
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile (((f b), (not ((f b) = b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (y,true ) -> wwhile (f, y);;

let fixpoint (f,b) = wwhile ((fun x  -> (x, ((f x) = x))), b);;

*)

(* changed spans
(5,29)-(5,55)
(5,30)-(5,35)
(5,31)-(5,32)
(5,33)-(5,34)
(5,37)-(5,54)
(5,38)-(5,41)
(5,46)-(5,47)
(5,51)-(5,52)
(5,57)-(5,58)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(5,21)-(5,27)
(5,21)-(5,59)
(5,28)-(5,59)
(5,29)-(5,55)
*)
