
let g x f = ((f x), ((f x) = x));;

let h q x y = q x y;;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((h g f b), b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,22)-(2,23)
x * x
BopG VarG VarG

(4,14)-(4,15)
x < 100
BopG VarG LitG

(4,18)-(4,19)
100
LitG

*)
