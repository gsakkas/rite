
let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((), b);;


(* fix

let helper (f,b) = let f b = let x = f b in (x, (x != b)) in f;;

let rec wwhile (f,b) =
  let (x,y) = f b in match y with | false  -> x | true  -> wwhile (f, x);;

let fixpoint (f,b) = wwhile ((helper (f, b)), b);;

*)

(* changed spans
(5,30)-(5,32)
helper (f , b)
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,18)
(3,60)-(3,66)
(3,60)-(3,73)
(3,67)-(3,73)
(3,68)-(3,69)
(5,22)-(5,28)
(5,22)-(5,36)
(5,29)-(5,36)
(5,30)-(5,32)
*)
