
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b = if (f b) = b then (b, b) else (b, b) in wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (2, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,12)-(7,52)
fun x -> (2 , f b = b)
LamG VarPatG (TupleG (fromList [EmptyG]))

(7,64)-(7,72)
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
(7,3)-(7,76)
(7,12)-(7,52)
(7,16)-(7,52)
(7,46)-(7,52)
(7,56)-(7,62)
(7,56)-(7,76)
(7,63)-(7,76)
(7,64)-(7,72)
(7,65)-(7,69)
*)
