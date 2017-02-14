
let helper (x,r) = let m = x r in match m with | r -> (r, false);;

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
(2,13)-(2,64)
(2,20)-(2,64)
(2,28)-(2,29)
(2,28)-(2,31)
(2,30)-(2,31)
(2,35)-(2,64)
(2,41)-(2,42)
(2,56)-(2,57)
(2,56)-(2,64)
(2,59)-(2,64)
(4,17)-(5,72)
*)

(* type error slice
(2,4)-(2,67)
(2,13)-(2,64)
(2,20)-(2,64)
(2,35)-(2,64)
(2,56)-(2,64)
(5,15)-(5,16)
(5,15)-(5,18)
(5,60)-(5,66)
(5,60)-(5,72)
(5,68)-(5,69)
(5,68)-(5,72)
(7,22)-(7,28)
(7,22)-(7,48)
(7,31)-(7,37)
(7,31)-(7,43)
(7,31)-(7,48)
*)
