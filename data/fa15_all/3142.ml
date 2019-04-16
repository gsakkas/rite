
let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let b = f b in (b, (b != b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c) -> if c = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile ((fun fixb  -> let b = f b in (b, (fixb != b))), b);;

*)

(* changed spans
(5,30)-(5,60)
fun fixb ->
  (let b = f b in
   (b , fixb <> b))
LamG VarPatG (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,47)-(3,53)
(3,47)-(3,61)
(3,54)-(3,61)
(3,55)-(3,56)
(5,22)-(5,28)
(5,22)-(5,64)
(5,29)-(5,64)
(5,30)-(5,60)
(5,46)-(5,59)
*)
