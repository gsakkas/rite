
let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile (b, b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (num,b00l) -> if not b00l then num else wwhile (f, num);;

let fixpoint (f,b) = wwhile ((fun x  -> let y = f x in (y, (y != x))), b);;

*)

(* changed spans
(5,30)-(5,31)
fun x ->
  (let y = f x in (y , y <> x))
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,3)-(3,75)
(3,9)-(3,10)
(3,9)-(3,12)
(3,60)-(3,66)
(3,60)-(3,75)
(3,67)-(3,75)
(3,68)-(3,69)
(3,71)-(3,74)
(5,22)-(5,28)
(5,22)-(5,35)
(5,29)-(5,35)
(5,30)-(5,31)
(5,33)-(5,34)
*)
