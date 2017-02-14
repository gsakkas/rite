
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
(6,21)-(6,49)
(6,30)-(6,31)
(6,35)-(6,41)
(6,35)-(6,49)
(6,42)-(6,49)
(6,43)-(6,45)
*)

(* type error slice
(3,12)-(3,13)
(3,12)-(3,15)
(4,42)-(4,48)
(4,42)-(4,55)
(4,49)-(4,55)
(4,50)-(4,51)
(6,21)-(6,49)
(6,30)-(6,31)
(6,35)-(6,41)
(6,35)-(6,49)
(6,42)-(6,49)
(6,43)-(6,45)
*)
