
let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

let fixpoint (f,b) = wwhile ((let func (x,y) = (f x) = y in func), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

let fixpoint (f,b) = wwhile ((fun b'  -> let x = f b' in (x, (b' != x))), b);;

*)

(* changed spans
(5,30)-(5,66)
fun b' ->
  (let x = f b' in
   (x , b' <> x))
LamG VarPatG (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(3,3)-(3,78)
(3,17)-(3,18)
(3,17)-(3,20)
(3,49)-(3,55)
(3,49)-(3,63)
(3,56)-(3,63)
(3,57)-(3,58)
(5,22)-(5,28)
(5,22)-(5,70)
(5,29)-(5,70)
(5,30)-(5,66)
(5,41)-(5,57)
(5,48)-(5,57)
(5,61)-(5,65)
*)
