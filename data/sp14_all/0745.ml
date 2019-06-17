
let h x y = ((y x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((h b f), b);;


(* fix

let h x = ((x * x), (x < 100));;

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (h, b);;

*)

(* changed spans
(2,9)-(2,31)
(x * x , x < 100)
TupleG [BopG EmptyG EmptyG,BopG EmptyG EmptyG]

(7,30)-(7,37)
h
VarG

*)

(* type error slice
(2,4)-(2,33)
(2,7)-(2,31)
(2,9)-(2,31)
(2,13)-(2,31)
(5,9)-(5,10)
(5,9)-(5,12)
(5,50)-(5,56)
(5,50)-(5,63)
(5,57)-(5,63)
(5,58)-(5,59)
(7,22)-(7,28)
(7,22)-(7,41)
(7,29)-(7,41)
(7,30)-(7,37)
(7,31)-(7,32)
*)
