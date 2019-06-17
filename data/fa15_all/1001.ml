
let helper (f,b) = let f b = let x = f in (x, (x != b)) in f b;;

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
(2,38)-(2,39)
f b
AppG [VarG]

(2,60)-(2,63)
f
VarG

*)

(* type error slice
(2,4)-(2,65)
(2,13)-(2,63)
(2,20)-(2,63)
(2,26)-(2,56)
(2,30)-(2,56)
(2,43)-(2,56)
(2,60)-(2,61)
(2,60)-(2,63)
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
