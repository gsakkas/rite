
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let (x,y) = f b in (x, ((x > b) || (x < b)))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(6,11)-(6,57)
let a =
  fun x ->
    (let xx = f x in
     (xx , x <> b)) in
a
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,33)-(3,39)
(3,33)-(3,46)
(3,40)-(3,46)
(3,41)-(3,42)
(6,3)-(6,9)
(6,3)-(6,61)
(6,10)-(6,61)
(6,11)-(6,57)
(6,31)-(6,56)
*)
