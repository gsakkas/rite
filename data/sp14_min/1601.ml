
let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) = wwhile ((let (x,y) = f b in (x > b) or (x < b)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,true ) -> wwhile (f, x) | (x,false ) -> x;;

let fixpoint (f,b) =
  wwhile ((let a x = let xx = f x in (xx, (x <> b)) in a), b);;

*)

(* changed spans
(5,30)-(5,69)
let a =
  fun x ->
    (let xx = f x in
     (xx , x <> b)) in
a
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] VarG

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,33)-(3,39)
(3,33)-(3,46)
(3,40)-(3,46)
(3,41)-(3,42)
(5,22)-(5,28)
(5,22)-(5,73)
(5,29)-(5,73)
(5,30)-(5,69)
(5,50)-(5,68)
*)
