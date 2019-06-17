
let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let inwwhile x = f x in ((inwwhile b), ((inwwhile b) != b))), b);;


(* fix

let rec wwhile (f,b) =
  let rec wwhelper f b =
    let (b',c') = f b in if c' = false then b' else wwhelper f b' in
  wwhelper f b;;

let fixpoint (f,b) =
  wwhile ((let inwwhile x = let xx = f x in (xx, (xx != b)) in inwwhile), b);;

*)

(* changed spans
(8,29)-(8,32)
let xx = f x in (xx , xx <> b)
LetG NonRec [(VarPatG,AppG [EmptyG])] (TupleG [EmptyG,EmptyG])

(8,36)-(8,71)
inwwhile
VarG

*)

(* type error slice
(2,4)-(5,17)
(2,17)-(5,15)
(4,19)-(4,20)
(4,19)-(4,22)
(4,53)-(4,61)
(4,53)-(4,66)
(4,62)-(4,63)
(5,3)-(5,11)
(5,3)-(5,15)
(5,12)-(5,13)
(8,3)-(8,9)
(8,3)-(8,76)
(8,10)-(8,76)
(8,11)-(8,72)
(8,36)-(8,71)
*)
