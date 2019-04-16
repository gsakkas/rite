
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (f, (((f b) = (f (b - 1))) && ((f b) = b)));;


(* fix

let func (f,b) b = ((f b), ((f b) == b));;

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((func (f, b)), b);;

*)

(* changed spans
(5,30)-(5,31)
func (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

(5,33)-(5,71)
b
VarG

*)

(* type error slice
(3,3)-(3,64)
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(5,22)-(5,28)
(5,22)-(5,72)
(5,29)-(5,72)
(5,30)-(5,31)
(5,46)-(5,53)
(5,47)-(5,48)
(5,59)-(5,70)
(5,60)-(5,65)
(5,61)-(5,62)
(5,68)-(5,69)
*)
