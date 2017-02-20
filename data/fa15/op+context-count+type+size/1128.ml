
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

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,33)-(3,34)
(3,50)-(3,63)
(3,50)-(3,56)
(3,57)-(3,63)
(3,58)-(3,59)
(3,61)-(3,62)
(5,14)-(5,49)
(5,21)-(5,49)
(5,21)-(5,27)
(5,28)-(5,49)
(5,29)-(5,45)
(5,30)-(5,31)
(5,33)-(5,44)
(5,34)-(5,39)
(5,35)-(5,36)
(5,37)-(5,38)
(5,42)-(5,43)
(5,47)-(5,48)
*)
