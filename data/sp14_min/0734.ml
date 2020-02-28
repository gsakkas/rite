
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let g x y = ((y x), false) in ((g b f), b));;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(5,29)-(5,73)
(h , b)
TupleG [VarG,VarG]

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(5,22)-(5,28)
(5,22)-(5,73)
(5,29)-(5,73)
(5,36)-(5,56)
(5,38)-(5,56)
(5,42)-(5,56)
(5,60)-(5,72)
(5,61)-(5,68)
(5,62)-(5,63)
*)
