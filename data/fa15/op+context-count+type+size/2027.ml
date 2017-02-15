
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
(2,12)-(2,64)
(2,19)-(2,64)
(2,27)-(2,28)
(2,27)-(2,30)
(2,29)-(2,30)
(2,34)-(2,64)
(2,40)-(2,41)
(2,54)-(2,64)
(2,55)-(2,56)
(2,58)-(2,63)
(4,16)-(5,72)
*)

(* type error slice
(2,3)-(2,66)
(2,12)-(2,64)
(2,19)-(2,64)
(2,34)-(2,64)
(2,54)-(2,64)
(5,14)-(5,15)
(5,14)-(5,17)
(5,59)-(5,65)
(5,59)-(5,72)
(5,66)-(5,72)
(5,67)-(5,68)
(7,21)-(7,27)
(7,21)-(7,48)
(7,28)-(7,48)
(7,29)-(7,44)
(7,30)-(7,36)
*)
