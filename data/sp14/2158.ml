
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
(6,56)-(6,57)
g
VarG

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
(6,13)-(6,44)
(6,22)-(6,23)
(6,22)-(6,25)
(6,24)-(6,25)
(6,34)-(6,43)
(6,35)-(6,37)
(6,41)-(6,42)
(6,48)-(6,54)
(6,48)-(6,61)
(6,55)-(6,61)
(6,56)-(6,57)
*)
