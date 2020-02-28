
let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x y x y = (y, true) in ((func f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with
  | (b',c') -> (match c' with | true  -> wwhile (f, b') | false  -> b');;

let fixpoint (f,b) = wwhile (let func x x = (0, true) in ((func b), b));;

*)

(* changed spans
(6,41)-(6,58)
fun x -> (0 , true)
LamG VarPatG (TupleG [EmptyG,EmptyG])

(6,63)-(6,73)
func b
AppG [VarG]

*)

(* type error slice
(3,3)-(4,72)
(3,9)-(3,10)
(3,9)-(3,12)
(4,42)-(4,48)
(4,42)-(4,56)
(4,49)-(4,56)
(4,50)-(4,51)
(6,22)-(6,28)
(6,22)-(6,78)
(6,29)-(6,78)
(6,39)-(6,58)
(6,41)-(6,58)
(6,43)-(6,58)
(6,45)-(6,58)
(6,62)-(6,77)
(6,63)-(6,73)
(6,64)-(6,68)
*)
