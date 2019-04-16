
let intboolf f x = ((f x), ((f x) < 1));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (intboolf, b);;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(7,30)-(7,38)
func (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(2,42)
(2,14)-(2,40)
(2,16)-(2,40)
(5,3)-(5,64)
(5,9)-(5,10)
(5,9)-(5,12)
(5,42)-(5,48)
(5,42)-(5,56)
(5,49)-(5,56)
(5,50)-(5,51)
(7,22)-(7,28)
(7,22)-(7,42)
(7,29)-(7,42)
(7,30)-(7,38)
*)
