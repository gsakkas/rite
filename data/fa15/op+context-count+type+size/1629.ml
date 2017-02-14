
let rec wwhile (f,b) = if f b then f (f, b) else 1;;


(* fix

let rec wwhile (f,b) = let (i,t) = f b in if t then wwhile (f, i) else i;;

*)

(* changed spans
(2,24)-(2,51)
(2,36)-(2,37)
(2,36)-(2,43)
(2,42)-(2,43)
(2,50)-(2,51)
*)

(* type error slice
(2,36)-(2,37)
(2,36)-(2,43)
(2,39)-(2,40)
(2,39)-(2,43)
*)
