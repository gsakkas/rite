
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
(3,3)-(3,72)
(3,15)-(3,18)
(3,22)-(3,72)
(3,28)-(3,29)
(3,47)-(3,48)
(3,60)-(3,66)
(3,60)-(3,72)
(3,68)-(3,69)
(5,15)-(5,35)
(5,22)-(5,28)
(5,22)-(5,35)
(5,30)-(5,32)
(5,30)-(5,35)
*)

(* type error slice
(3,15)-(3,16)
(3,15)-(3,18)
(3,60)-(3,66)
(3,60)-(3,72)
(3,68)-(3,69)
(3,68)-(3,72)
(5,22)-(5,28)
(5,22)-(5,35)
(5,30)-(5,32)
(5,30)-(5,35)
*)
