
let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile (f, (b, (b != (f b))));;


(* fix

let rec wwhile (f,b) =
  let pair = f b in
  let (b',c') = pair in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (x != (f x)))), b);;

*)

(* changed spans
(6,30)-(6,31)
fun x -> (f x , x <> f x)
LamG VarPatG (TupleG (fromList [EmptyG]))

(6,33)-(6,50)
b
VarG

*)

(* type error slice
(3,3)-(4,66)
(3,14)-(3,15)
(3,14)-(3,17)
(4,3)-(4,66)
(4,17)-(4,21)
(4,52)-(4,58)
(4,52)-(4,66)
(4,59)-(4,66)
(4,60)-(4,61)
(4,63)-(4,65)
(6,22)-(6,28)
(6,22)-(6,51)
(6,29)-(6,51)
(6,30)-(6,31)
(6,33)-(6,50)
(6,34)-(6,35)
(6,37)-(6,49)
(6,38)-(6,39)
(6,43)-(6,48)
(6,44)-(6,45)
*)
