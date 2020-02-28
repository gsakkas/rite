
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g x = let bb = f b in (bb, (bb = b)) in (f, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g x = let bb = f b in (bb, (bb = b)) in (g, b));;

*)

(* changed spans
(6,56)-(6,57)
g
VarG

*)

(* type error slice
(3,3)-(3,64)
(3,9)-(3,10)
(3,9)-(3,12)
(3,51)-(3,57)
(3,51)-(3,64)
(3,58)-(3,64)
(3,59)-(3,60)
(3,62)-(3,63)
(6,3)-(6,9)
(6,3)-(6,62)
(6,10)-(6,62)
(6,21)-(6,51)
(6,30)-(6,31)
(6,30)-(6,33)
(6,42)-(6,50)
(6,43)-(6,45)
(6,48)-(6,49)
(6,55)-(6,61)
(6,56)-(6,57)
(6,59)-(6,60)
*)
