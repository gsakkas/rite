
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
(6,29)-(6,62)
(fun x -> (b , f b = b) , b)
TupleG [LamG EmptyPatG EmptyG,VarG]

*)

(* type error slice
(4,43)-(4,49)
(4,43)-(4,56)
(4,50)-(4,56)
(6,22)-(6,28)
(6,22)-(6,62)
(6,29)-(6,62)
*)
