
let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) = wwhile (let n x = (f, (b = (f b))) in (n, b));;


(* fix

let rec wwhile (f,b) =
  let temp = f b in
  match temp with | (a,boolean) -> if boolean then wwhile (f, a) else a;;

let fixpoint (f,b) =
  wwhile (let n x = let ff = f b in (ff, (b = ff)) in (n, b));;

*)

(* changed spans
(6,40)-(6,56)
let ff = f b in (ff , b = ff)
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (TupleG (fromList [EmptyG]))

*)

(* type error slice
(3,3)-(4,72)
(3,14)-(3,15)
(3,14)-(3,17)
(4,3)-(4,72)
(4,9)-(4,13)
(4,52)-(4,58)
(4,52)-(4,65)
(4,59)-(4,65)
(4,60)-(4,61)
(4,63)-(4,64)
(6,22)-(6,28)
(6,22)-(6,67)
(6,29)-(6,67)
(6,36)-(6,56)
(6,40)-(6,56)
(6,41)-(6,42)
(6,49)-(6,54)
(6,50)-(6,51)
(6,52)-(6,53)
(6,60)-(6,66)
(6,61)-(6,62)
(6,64)-(6,65)
*)
