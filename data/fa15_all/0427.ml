
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b1 = if (f b1) = b then (1, b) else (1, b) in wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (2, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,12)-(7,54)
fun x -> (2 , f b = b)
LamG VarPatG (TupleG (fromList [EmptyG]))

(7,66)-(7,74)
funt
VarG

*)

(* type error slice
(3,13)-(3,14)
(3,13)-(3,16)
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(4,51)-(4,52)
(7,3)-(7,78)
(7,12)-(7,54)
(7,17)-(7,54)
(7,48)-(7,54)
(7,58)-(7,64)
(7,58)-(7,78)
(7,65)-(7,78)
(7,66)-(7,74)
(7,67)-(7,71)
*)
