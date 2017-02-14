
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin (f,b) = (b, ((f b) = b)) in (fin, b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let fin bt = (bt, ((f bt) = bt)) in (fin, b));;

*)

(* changed spans
(4,39)-(4,60)
(4,47)-(4,48)
(4,54)-(4,55)
(4,59)-(4,60)
(4,67)-(4,73)
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
(4,22)-(4,73)
(4,30)-(4,73)
(4,30)-(4,73)
(4,39)-(4,60)
(4,47)-(4,48)
(4,47)-(4,60)
(4,67)-(4,70)
(4,67)-(4,73)
*)
