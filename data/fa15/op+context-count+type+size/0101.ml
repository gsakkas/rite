
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt = ((f b), ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,21)-(6,72)
(6,32)-(6,52)
(6,33)-(6,38)
(6,40)-(6,51)
(6,41)-(6,46)
(6,42)-(6,43)
(6,49)-(6,50)
(6,56)-(6,72)
*)

(* type error slice
(3,12)-(3,13)
(3,12)-(3,15)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(6,21)-(6,72)
(6,32)-(6,52)
(6,56)-(6,62)
(6,56)-(6,72)
(6,63)-(6,72)
(6,64)-(6,68)
*)
