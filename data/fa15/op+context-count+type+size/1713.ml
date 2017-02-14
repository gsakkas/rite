
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = (f, ((f x) = x)) in f'), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((let f' x = ((f x), ((f x) = x)) in f'), b);;

*)

(* changed spans
(4,43)-(4,44)
(4,48)-(4,56)
*)

(* type error slice
(2,4)-(2,80)
(2,17)-(2,78)
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,56)-(2,62)
(2,56)-(2,69)
(2,64)-(2,69)
(2,67)-(2,69)
(4,22)-(4,28)
(4,22)-(4,68)
(4,31)-(4,64)
(4,31)-(4,64)
(4,31)-(4,68)
(4,38)-(4,56)
(4,43)-(4,44)
(4,43)-(4,56)
(4,48)-(4,49)
(4,48)-(4,51)
(4,50)-(4,51)
(4,62)-(4,64)
*)
