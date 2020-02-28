
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
(4,7)-(4,20)
fun x -> (x * x , x < 100)
LamG VarPatG (TupleG [EmptyG,EmptyG])

(9,30)-(9,39)
h
VarG

*)

(* type error slice
(2,4)-(2,35)
(2,7)-(2,33)
(2,9)-(2,33)
(2,13)-(2,33)
(4,4)-(4,22)
(4,7)-(4,20)
(4,9)-(4,20)
(4,11)-(4,20)
(4,15)-(4,16)
(4,15)-(4,20)
(7,9)-(7,10)
(7,9)-(7,12)
(7,50)-(7,56)
(7,50)-(7,63)
(7,57)-(7,63)
(7,58)-(7,59)
(9,22)-(9,28)
(9,22)-(9,43)
(9,29)-(9,43)
(9,30)-(9,39)
(9,31)-(9,32)
(9,33)-(9,34)
*)
