
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) = wwhile (if (f b) = b then (b, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  wwhile ((let f x = let xx = (x * x) * x in (xx, (xx < 100)) in f), b);;

*)

(* changed spans
(5,29)-(5,55)
(let f =
   fun x ->
     (let xx = (x * x) * x in
      (xx , xx < 100)) in
 f , b)
TupleG (fromList [VarG,LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG])

*)

(* type error slice
(5,29)-(5,55)
(5,48)-(5,54)
(5,54)-(5,54)
*)
