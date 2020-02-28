
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
(6,33)-(6,53)
fun b ->
  if f b
  then (b , true)
  else (b , false)
LamG VarPatG (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(6,22)-(6,73)
(6,33)-(6,53)
(6,57)-(6,63)
(6,57)-(6,73)
(6,64)-(6,73)
(6,65)-(6,69)
*)
