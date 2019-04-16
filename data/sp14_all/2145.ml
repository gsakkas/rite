
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (b, b);;


(* fix

let fixpoint (f,b) = b;;

*)

(* changed spans
(5,22)-(5,35)
b
VarG

*)

(* type error slice
(3,3)-(3,63)
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(3,61)-(3,62)
(5,22)-(5,28)
(5,22)-(5,35)
(5,29)-(5,35)
(5,30)-(5,31)
(5,33)-(5,34)
*)
