
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile f b else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b) else b';;

*)

(* changed spans
(2,55)-(2,65)
(2,62)-(2,63)
*)

(* type error slice
(2,3)-(2,75)
(2,16)-(2,73)
(2,55)-(2,61)
(2,55)-(2,65)
(2,62)-(2,63)
*)
