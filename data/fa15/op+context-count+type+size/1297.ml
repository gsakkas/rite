
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin (f,b) = (b, ((f b) = b)) in (fin, b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(4,38)-(4,61)
(4,46)-(4,47)
(4,53)-(4,54)
(4,58)-(4,59)
(4,65)-(4,73)
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
(4,21)-(4,74)
(4,28)-(4,74)
(4,28)-(4,74)
(4,38)-(4,61)
(4,45)-(4,61)
(4,46)-(4,47)
(4,65)-(4,73)
(4,66)-(4,69)
*)
