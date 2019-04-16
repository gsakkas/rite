
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) =
  let funt b1 = if (f b1) = b then (b1, b) else (b1, b) in
  wwhile ((funt b), b);;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = let funt x = (2, ((f b) = b)) in wwhile (funt, b);;

*)

(* changed spans
(7,12)-(7,56)
fun x -> (2 , f b = b)
LamG VarPatG (TupleG (fromList [EmptyG]))

(8,11)-(8,19)
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
(7,3)-(8,23)
(7,12)-(7,56)
(7,17)-(7,56)
(7,49)-(7,56)
(8,3)-(8,9)
(8,3)-(8,23)
(8,10)-(8,23)
(8,11)-(8,19)
(8,12)-(8,16)
*)
