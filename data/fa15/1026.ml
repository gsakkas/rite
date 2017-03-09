
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun f'  -> fun x  -> (f, ((f x) = x))), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((f x) = x)) in f'), b);;

*)

(* changed spans
(4,29)-(4,68)
(4,52)-(4,53)
(4,55)-(4,66)
(4,70)-(4,71)
*)

(* type error slice
(2,23)-(2,77)
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(4,21)-(4,27)
(4,21)-(4,72)
(4,28)-(4,72)
(4,29)-(4,68)
(4,41)-(4,67)
*)

(* all spans
(2,16)-(2,77)
(2,23)-(2,77)
(2,37)-(2,40)
(2,37)-(2,38)
(2,39)-(2,40)
(2,44)-(2,77)
(2,47)-(2,49)
(2,55)-(2,69)
(2,55)-(2,61)
(2,62)-(2,69)
(2,63)-(2,64)
(2,66)-(2,68)
(2,75)-(2,77)
(4,14)-(4,72)
(4,21)-(4,72)
(4,21)-(4,27)
(4,28)-(4,72)
(4,29)-(4,68)
(4,41)-(4,67)
(4,51)-(4,67)
(4,52)-(4,53)
(4,55)-(4,66)
(4,56)-(4,61)
(4,57)-(4,58)
(4,59)-(4,60)
(4,64)-(4,65)
(4,70)-(4,71)
*)