
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun f  -> b = (f b)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,29)-(4,50)
(4,40)-(4,41)
(4,40)-(4,49)
(4,44)-(4,49)
(4,52)-(4,53)
*)

(* type error slice
(2,23)-(2,72)
(2,35)-(2,36)
(2,35)-(2,38)
(2,52)-(2,58)
(2,52)-(2,65)
(2,59)-(2,65)
(2,60)-(2,61)
(4,21)-(4,27)
(4,21)-(4,54)
(4,28)-(4,54)
(4,29)-(4,50)
(4,40)-(4,49)
*)
