
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((wwhile (f, b)), (b = (f b)))), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun x  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,42)-(4,48)
(4,49)-(4,55)
*)

(* type error slice
(2,23)-(2,72)
(2,35)-(2,36)
(2,35)-(2,38)
(2,52)-(2,58)
(2,52)-(2,65)
(2,59)-(2,65)
(2,60)-(2,61)
(2,63)-(2,64)
(4,41)-(4,56)
(4,42)-(4,48)
(4,49)-(4,55)
(4,50)-(4,51)
(4,53)-(4,54)
(4,58)-(4,69)
(4,58)-(4,69)
(4,59)-(4,60)
(4,63)-(4,68)
(4,64)-(4,65)
*)

(* all spans
(2,16)-(2,72)
(2,23)-(2,72)
(2,35)-(2,38)
(2,35)-(2,36)
(2,37)-(2,38)
(2,42)-(2,72)
(2,45)-(2,46)
(2,52)-(2,65)
(2,52)-(2,58)
(2,59)-(2,65)
(2,60)-(2,61)
(2,63)-(2,64)
(2,71)-(2,72)
(4,14)-(4,75)
(4,21)-(4,75)
(4,21)-(4,27)
(4,28)-(4,75)
(4,29)-(4,71)
(4,40)-(4,70)
(4,41)-(4,56)
(4,42)-(4,48)
(4,49)-(4,55)
(4,50)-(4,51)
(4,53)-(4,54)
(4,58)-(4,69)
(4,59)-(4,60)
(4,63)-(4,68)
(4,64)-(4,65)
(4,66)-(4,67)
(4,73)-(4,74)
*)
