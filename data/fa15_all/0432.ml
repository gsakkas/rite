
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (f, ((f b) = b)) in wwhile (funt, b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = ((f b), ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(6,36)-(6,37)
f b
AppG (fromList [VarG])

*)

(* type error slice
(3,3)-(4,69)
(3,13)-(3,14)
(3,13)-(3,16)
(4,3)-(4,69)
(4,9)-(4,12)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(4,54)-(4,55)
(6,22)-(6,71)
(6,31)-(6,51)
(6,35)-(6,51)
(6,36)-(6,37)
(6,40)-(6,45)
(6,41)-(6,42)
(6,43)-(6,44)
(6,55)-(6,61)
(6,55)-(6,71)
(6,62)-(6,71)
(6,63)-(6,67)
(6,69)-(6,70)
*)
