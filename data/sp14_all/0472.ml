
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) = wwhile (((f b), (b = (f b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g x = let bb = f b in (bb, (bb = b)) in (g, b));;

*)

(* changed spans
(5,29)-(5,54)
let g =
  fun x ->
    (let bb = f b in
     (bb , bb = b)) in
(g , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,51)-(3,57)
(3,51)-(3,64)
(3,58)-(3,64)
(3,59)-(3,60)
(5,22)-(5,28)
(5,22)-(5,54)
(5,29)-(5,54)
(5,30)-(5,50)
*)
