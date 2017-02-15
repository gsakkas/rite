
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
(6,39)-(6,43)
*)

(* type error slice
(6,21)-(6,77)
(6,34)-(6,57)
(6,38)-(6,57)
(6,39)-(6,43)
*)
