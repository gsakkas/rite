
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (1, b) else (1, b) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, b) else (b, b) in wwhile (funt, b);;

*)

(* changed spans
(7,29)-(7,30)
b
VarG

(7,41)-(7,42)
b
VarG

*)

(* type error slice
(2,4)-(4,71)
(2,17)-(4,69)
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(3,15)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,31)-(4,32)
(4,31)-(4,39)
(4,35)-(4,39)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,54)-(4,55)
(7,3)-(7,66)
(7,12)-(7,46)
(7,16)-(7,46)
(7,40)-(7,46)
(7,41)-(7,42)
(7,44)-(7,45)
(7,50)-(7,56)
(7,50)-(7,66)
(7,57)-(7,66)
(7,58)-(7,62)
*)
