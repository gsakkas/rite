
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt = (f, ((f b) = b)) in wwhile (b, funt);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if f b then (b, true) else (b, false) in wwhile (funt, b);;

*)

(* changed spans
(6,33)-(6,49)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG VarPatG (IteG EmptyG EmptyG EmptyG)

(6,61)-(6,62)
funt
VarG

(6,64)-(6,68)
b
VarG

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
(6,22)-(6,69)
(6,33)-(6,49)
(6,34)-(6,35)
(6,38)-(6,43)
(6,39)-(6,40)
(6,41)-(6,42)
(6,53)-(6,59)
(6,53)-(6,69)
(6,60)-(6,69)
(6,61)-(6,62)
(6,64)-(6,68)
*)
