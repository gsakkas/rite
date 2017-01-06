
let rec wwhile (f,b) = let (b',c') = f b in if c' then f b' else b';;



let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;


(* changed spans
*)

(* type error slice
(2,38)-(2,41)
(2,45)-(2,68)
(2,56)-(2,60)
*)
