
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
(7,2)-(7,77)
2
LitG

(7,2)-(7,77)
(2 , f b = b)
TupleG (fromList [BopG EmptyG EmptyG,LitG])

(7,16)-(7,53)
fun x -> (2 , f b = b)
LamG (TupleG (fromList [EmptyG]))

*)
