
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (let g x = (x, false) in ((g f b), b));;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(5,29)-(5,67)
(h , b)
TupleG [VarG,VarG]

*)

(* type error slice
(5,29)-(5,67)
(5,36)-(5,50)
(5,40)-(5,50)
(5,55)-(5,62)
(5,56)-(5,57)
*)
