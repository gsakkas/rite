
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = (f, ((f x) = x)) in f'), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((f x) = x)) in f'), b);;

*)

(* changed spans
(4,42)-(4,43)
(4,45)-(4,56)
*)

(* type error slice
(2,3)-(2,79)
(2,16)-(2,77)
(2,23)-(2,77)
(2,37)-(2,38)
(2,37)-(2,40)
(2,39)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,66)-(2,68)
(4,21)-(4,27)
(4,21)-(4,68)
(4,28)-(4,68)
(4,29)-(4,64)
(4,29)-(4,64)
(4,37)-(4,57)
(4,41)-(4,57)
(4,42)-(4,43)
(4,46)-(4,51)
(4,47)-(4,48)
(4,49)-(4,50)
(4,61)-(4,63)
*)
