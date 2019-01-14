
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint = ((f x) - x) < 0 in (x, b) in wwhile (gs, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let gs x = let isFPoint = ((f x) - x) < 0 in (x, isFPoint) in
  wwhile (gs, b);;

*)

(* changed spans
(7,51)-(7,52)
isFPoint
VarG

*)
