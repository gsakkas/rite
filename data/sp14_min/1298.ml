
let rec wwhile (f,b) =
  let (i,c) = f b in if c = true then wwhile (f, i) else i;;

let fixpoint (f,b) =
  let g x = let xx = f x in (xx, (xx = x)) in g wwhile (g, b);;


(* fix

let rec wwhile (f,b) =
  let (i,c) = f b in if c = true then wwhile (f, i) else i;;

let fixpoint (f,b) =
  let g x = let xx = f x in (xx, (xx = x)) in wwhile (g, b);;

*)

(* changed spans
(6,47)-(6,62)
wwhile (g , b)
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(6,3)-(6,62)
(6,9)-(6,43)
(6,13)-(6,43)
(6,29)-(6,43)
(6,47)-(6,48)
(6,47)-(6,62)
*)
