
let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile (((f b) = (let rr = f b in (rr, (rr = b)))), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(5,30)-(5,72)
helper (f , b)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,18)
(3,60)-(3,66)
(3,60)-(3,73)
(3,67)-(3,73)
(3,68)-(3,69)
(5,22)-(5,28)
(5,22)-(5,76)
(5,29)-(5,76)
(5,30)-(5,72)
(5,31)-(5,36)
(5,32)-(5,33)
(5,39)-(5,71)
(5,49)-(5,50)
(5,49)-(5,52)
(5,56)-(5,70)
(5,57)-(5,59)
*)
