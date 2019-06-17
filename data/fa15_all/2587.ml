
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile (fun x  -> (((f b), (not (b = (f b)))), b));;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (not (b = (f b))))), b);;

*)

(* changed spans
(4,29)-(4,72)
(fun x ->
   (f b , not (b = f b)) , b)
TupleG [LamG EmptyPatG EmptyG,VarG]

*)

(* type error slice
(2,53)-(2,59)
(2,53)-(2,66)
(2,60)-(2,66)
(4,22)-(4,28)
(4,22)-(4,72)
(4,29)-(4,72)
*)
