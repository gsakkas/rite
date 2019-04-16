
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
(7,52)-(7,53)
isFPoint
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
(4,54)-(4,55)
(7,3)-(7,72)
(7,10)-(7,54)
(7,14)-(7,54)
(7,29)-(7,40)
(7,38)-(7,39)
(7,48)-(7,54)
(7,49)-(7,50)
(7,52)-(7,53)
(7,58)-(7,64)
(7,58)-(7,72)
(7,65)-(7,72)
(7,66)-(7,68)
(7,70)-(7,71)
*)
