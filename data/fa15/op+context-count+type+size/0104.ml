
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
(7,35)-(7,36)
(7,44)-(7,48)
(7,44)-(7,51)
(7,50)-(7,51)
(7,56)-(7,71)
*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,31)-(4,32)
(4,31)-(4,39)
(4,31)-(4,39)
(4,35)-(4,39)
(4,43)-(4,49)
(4,43)-(4,55)
(4,51)-(4,52)
(4,51)-(4,55)
(7,3)-(7,71)
(7,12)-(7,51)
(7,16)-(7,51)
(7,29)-(7,36)
(7,35)-(7,36)
(7,56)-(7,62)
(7,56)-(7,71)
(7,64)-(7,68)
(7,64)-(7,71)
*)
