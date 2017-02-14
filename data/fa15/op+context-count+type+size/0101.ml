
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
(6,22)-(6,72)
(6,35)-(6,38)
(6,35)-(6,51)
(6,43)-(6,44)
(6,43)-(6,46)
(6,43)-(6,51)
(6,50)-(6,51)
(6,57)-(6,72)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,52)
(4,51)-(4,55)
(6,22)-(6,72)
(6,35)-(6,51)
(6,57)-(6,63)
(6,57)-(6,72)
(6,65)-(6,69)
(6,65)-(6,72)
*)
