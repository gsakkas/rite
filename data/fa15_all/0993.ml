
let rec helper (f,b) = let (x,y) = f b in (x, (x = b));;

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
(2,24)-(2,55)
let f =
  fun b ->
    (let x = f b in
     (x , x <> b)) in
f
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) VarG

*)

(* type error slice
(2,4)-(2,57)
(2,17)-(2,55)
(2,24)-(2,55)
(2,43)-(2,55)
(5,15)-(5,16)
(5,15)-(5,18)
(5,60)-(5,66)
(5,60)-(5,73)
(5,67)-(5,73)
(5,68)-(5,69)
(7,22)-(7,28)
(7,22)-(7,49)
(7,29)-(7,49)
(7,30)-(7,45)
(7,31)-(7,37)
*)
