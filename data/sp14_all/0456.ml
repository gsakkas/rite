
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((not (f b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  wwhile (let g x = let xx = f x in (xx, (xx != b)) in (g, b));;

*)

(* changed spans
(5,29)-(5,45)
let g =
  fun x ->
    (let xx = f x in
     (xx , xx <> b)) in
(g , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(5,22)-(5,28)
(5,22)-(5,45)
(5,29)-(5,45)
(5,30)-(5,41)
(5,31)-(5,34)
*)
