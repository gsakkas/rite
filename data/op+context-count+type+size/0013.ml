
let rec wwhile (f,b) = let (bs,cs) = f b in if cs then f bs else bs;;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(2,48)-(2,50)
(2,56)-(2,57)
(2,58)-(2,60)
(2,66)-(2,68)
*)

(* type error slice
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,45)-(2,68)
(2,56)-(2,57)
(2,56)-(2,60)
(2,58)-(2,60)
(2,66)-(2,68)
*)
