
let helper (f,b) =
  let x = f b in match x with | b -> (x, false) | _ -> (x, true);;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(3,3)-(3,65)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

*)

(* type error slice
(2,4)-(3,67)
(2,13)-(3,65)
(3,3)-(3,65)
(3,18)-(3,65)
(3,38)-(3,48)
(6,15)-(6,16)
(6,15)-(6,18)
(6,60)-(6,66)
(6,60)-(6,73)
(6,67)-(6,73)
(6,68)-(6,69)
(8,22)-(8,28)
(8,22)-(8,49)
(8,29)-(8,49)
(8,30)-(8,45)
(8,31)-(8,37)
*)
