
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let rec funt x = (funt, ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let rec funt x = (b, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(6,40)-(6,44)
b
VarG

*)

(* type error slice
(6,22)-(6,78)
(6,35)-(6,58)
(6,39)-(6,58)
(6,40)-(6,44)
*)
