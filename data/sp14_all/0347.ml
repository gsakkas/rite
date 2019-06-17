
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile (let xx = (b * b) * b in ((xx, (xx < 100)), b));;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,29)-(6,76)
(let d =
   fun x ->
     (let xx = f b in
      (xx , xx = b)) in
 d , b)
TupleG [LetG NonRec [(EmptyPatG,EmptyG)] EmptyG,VarG]

*)

(* type error slice
(3,14)-(3,15)
(3,14)-(3,17)
(4,41)-(4,47)
(4,41)-(4,58)
(4,48)-(4,58)
(4,49)-(4,50)
(6,22)-(6,28)
(6,22)-(6,76)
(6,29)-(6,76)
(6,54)-(6,75)
(6,55)-(6,71)
*)
