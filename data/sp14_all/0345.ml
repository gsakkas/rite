
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) = wwhile (let xx = f b in ((xx, (xx = b)), b));;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

let fixpoint (f,b) =
  wwhile ((let d x = let xx = f b in (xx, (xx = b)) in d), b);;

*)

(* changed spans
(6,29)-(6,66)
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
(6,22)-(6,66)
(6,29)-(6,66)
(6,46)-(6,65)
(6,47)-(6,61)
*)
