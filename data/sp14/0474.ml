
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g = let bb = f b in (bb, (bb = b)) in (g, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g x = let bb = f x in (bb, (bb = x)) in (g, b));;

*)

(* changed spans
(6,19)-(6,49)
fun x ->
  (let bb = f x in
   (bb , bb = x))
LamG VarPatG (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,51)-(3,57)
(3,51)-(3,64)
(3,58)-(3,64)
(3,59)-(3,60)
(6,3)-(6,9)
(6,3)-(6,60)
(6,10)-(6,60)
(6,19)-(6,49)
(6,35)-(6,49)
(6,53)-(6,59)
(6,54)-(6,55)
*)
