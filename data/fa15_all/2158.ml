
let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  let g x = let xx = f x in (xx, (xx != x)) in wwhile (f, b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,b) -> if not b then a else wwhile (f, a);;

let fixpoint (f,b) =
  let g x = let xx = f x in (xx, (xx != x)) in wwhile (g, b);;

*)

(* changed spans
(6,55)-(6,56)
g
VarG

*)
