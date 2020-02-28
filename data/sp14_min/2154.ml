
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile ((fun x  -> x), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,30)-(5,43)
let f =
  fun x ->
    (let xx = (x * x) * x in
     (xx , xx < 100)) in
f
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(2,4)-(3,65)
(2,17)-(3,63)
(3,3)-(3,63)
(3,9)-(3,10)
(3,9)-(3,12)
(3,11)-(3,12)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,61)-(3,62)
(5,22)-(5,28)
(5,22)-(5,47)
(5,29)-(5,47)
(5,30)-(5,43)
(5,41)-(5,42)
*)
