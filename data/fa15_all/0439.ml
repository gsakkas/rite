
let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile (fun x  -> ((b, ((f b) = b)), b));;


(* fix

let rec wwhile (f,b) =
  let res = f b in
  match res with | (x,y) when y = true -> wwhile (f, x) | (x,y) -> x;;

let fixpoint (f,b) = wwhile ((fun x  -> (b, ((f b) = b))), b);;

*)

(* changed spans
(6,21)-(6,27)
fun x -> (b , f b = b)
LamG (TupleG (fromList [EmptyG]))

*)
