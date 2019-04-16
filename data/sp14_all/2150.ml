
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((f (if (f b) = b then b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,30)-(5,55)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(5,22)-(5,28)
(5,22)-(5,59)
(5,29)-(5,59)
(5,30)-(5,55)
(5,31)-(5,32)
(5,33)-(5,54)
(5,37)-(5,42)
(5,37)-(5,46)
(5,38)-(5,39)
(5,45)-(5,46)
(5,52)-(5,53)
(5,53)-(5,53)
*)
