
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let fx = 2 in wwhile (fx, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,22)-(6,49)
(6,31)-(6,32)
(6,36)-(6,42)
(6,36)-(6,49)
(6,44)-(6,46)
(6,44)-(6,49)
*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,52)
(4,51)-(4,55)
(6,22)-(6,49)
(6,31)-(6,32)
(6,36)-(6,42)
(6,36)-(6,49)
(6,44)-(6,46)
(6,44)-(6,49)
*)
