
let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) = wwhile ((fun y  -> fun x  -> ((f x), ((f x) != b))), b);;


(* fix

let rec wwhile (f,b) =
  let (number,boolean) = f b in
  if boolean then wwhile (f, number) else number;;

let fixpoint (f,b) =
  wwhile (let y x = let xx = f x in (xx, (xx != x)) in (y, b));;

*)

(* changed spans
(6,29)-(6,77)
let y =
  fun x ->
    (let xx = f x in
     (xx , xx <> x)) in
(y , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (TupleG [EmptyG,EmptyG])

*)

(* type error slice
(3,3)-(4,49)
(3,26)-(3,27)
(3,26)-(3,29)
(4,19)-(4,25)
(4,19)-(4,37)
(4,26)-(4,37)
(4,27)-(4,28)
(6,22)-(6,28)
(6,22)-(6,77)
(6,29)-(6,77)
(6,30)-(6,73)
(6,41)-(6,72)
*)
