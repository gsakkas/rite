
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let gs x = (x, (((f x) - x) >= 0)) in wwhile ((f gs), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let gs x = ((f x), (((f x) - x) >= 0)) in wwhile (gs, b);;

*)

(* changed spans
(6,34)-(6,35)
f x
AppG [VarG]

(6,68)-(6,74)
gs
VarG

*)

(* type error slice
(6,22)-(6,78)
(6,29)-(6,56)
(6,39)-(6,44)
(6,40)-(6,41)
(6,42)-(6,43)
(6,68)-(6,74)
(6,69)-(6,70)
(6,71)-(6,73)
*)
