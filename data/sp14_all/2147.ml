
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (if (f b) = b then b else wwhile (f, (f b)));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,29)-(5,73)
(let f =
   fun x ->
     (let xx = (x * x) * x in
      (xx , xx < 100)) in
 f , b)
TupleG (fromList [VarG,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG])

*)

(* type error slice
(3,3)-(3,63)
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(3,61)-(3,62)
(5,22)-(5,28)
(5,22)-(5,73)
(5,29)-(5,73)
(5,48)-(5,49)
(5,55)-(5,61)
(5,55)-(5,72)
(5,62)-(5,72)
(5,63)-(5,64)
(5,66)-(5,71)
(5,67)-(5,68)
(5,69)-(5,70)
*)
