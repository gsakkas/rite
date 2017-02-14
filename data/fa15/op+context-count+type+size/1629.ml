
let rec wwhile (f,b) = if f b then f (f, b) else 1;;


(* fix

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

*)

(* changed spans
(2,23)-(2,50)
(2,35)-(2,36)
(2,35)-(2,43)
(2,41)-(2,42)
(2,49)-(2,50)
*)

(* type error slice
(2,35)-(2,36)
(2,35)-(2,43)
(2,37)-(2,43)
(2,38)-(2,39)
*)
