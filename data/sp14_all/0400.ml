
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) = let b' = f b in if b = b' then b else wwhile (f, b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = false then b' else wwhile (f, b');;

let fixpoint (f,b) =
  let f x = let xx = f b in (xx, (xx <> b)) in wwhile (f, b);;

*)

(* changed spans
(5,22)-(5,73)
let f =
  fun x ->
    (let xx = f b in
     (xx , xx <> b)) in
wwhile (f , b)
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (AppG [EmptyG])

*)

(* type error slice
(3,3)-(3,65)
(3,17)-(3,18)
(3,17)-(3,20)
(3,51)-(3,57)
(3,51)-(3,65)
(3,58)-(3,65)
(3,59)-(3,60)
(3,62)-(3,64)
(5,22)-(5,73)
(5,31)-(5,32)
(5,31)-(5,34)
(5,41)-(5,42)
(5,41)-(5,47)
(5,45)-(5,47)
(5,60)-(5,66)
(5,60)-(5,73)
(5,67)-(5,73)
(5,68)-(5,69)
(5,71)-(5,72)
*)
