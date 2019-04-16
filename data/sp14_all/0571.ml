
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) = wwhile (((f b), ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(6,29)-(6,54)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(3,26)-(3,27)
(3,26)-(3,29)
(4,19)-(4,25)
(4,19)-(4,37)
(4,26)-(4,37)
(4,27)-(4,28)
(6,22)-(6,28)
(6,22)-(6,54)
(6,29)-(6,54)
(6,30)-(6,50)
*)
