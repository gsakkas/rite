
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
(6,18)-(6,48)
fun x ->
  (let bb = f x in
   (bb , bb = x))
LamG (LetG NonRec [EmptyG] EmptyG)

(6,29)-(6,30)
x
VarG

(6,45)-(6,46)
x
VarG

*)
