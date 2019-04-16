
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((wwhile (f, b)), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,22)-(5,49)
let f =
  fun x ->
    (let xx = f b in
     (xx , xx <> b)) in
wwhile (f , b)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(3,65)
(3,17)-(3,18)
(3,17)-(3,20)
(3,24)-(3,65)
(3,43)-(3,45)
(3,51)-(3,57)
(3,51)-(3,65)
(3,58)-(3,65)
(3,59)-(3,60)
(5,22)-(5,28)
(5,22)-(5,49)
(5,29)-(5,49)
(5,30)-(5,45)
(5,31)-(5,37)
*)
