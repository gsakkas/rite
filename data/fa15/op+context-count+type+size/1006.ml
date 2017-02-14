
let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun f  -> fun x  -> x = (f x)), b);;


(* fix

let rec wwhile (f,b) = let (x,y) = f b in if y then wwhile (f, x) else x;;

let fixpoint (f,b) = wwhile ((fun y  -> ((f b), (b = (f b)))), b);;

*)

(* changed spans
(4,31)-(4,59)
(4,41)-(4,59)
(4,51)-(4,52)
(4,51)-(4,59)
(4,58)-(4,59)
*)

(* type error slice
(2,24)-(2,73)
(2,36)-(2,37)
(2,36)-(2,39)
(2,53)-(2,59)
(2,53)-(2,65)
(2,61)-(2,62)
(2,61)-(2,65)
(4,22)-(4,28)
(4,22)-(4,64)
(4,31)-(4,59)
(4,31)-(4,64)
(4,41)-(4,59)
*)
