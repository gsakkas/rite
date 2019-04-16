
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (true, 1) else (true, 1) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, b) else (b, b) in wwhile (funt, b);;

*)

(* changed spans
(7,29)-(7,33)
b
VarG

(7,35)-(7,36)
b
VarG

(7,44)-(7,48)
b
VarG

(7,50)-(7,51)
b
VarG

*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,31)-(4,32)
(4,31)-(4,39)
(4,35)-(4,39)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(7,3)-(7,72)
(7,12)-(7,52)
(7,16)-(7,52)
(7,43)-(7,52)
(7,50)-(7,51)
(7,56)-(7,62)
(7,56)-(7,72)
(7,63)-(7,72)
(7,64)-(7,68)
*)
