
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> f x not ((f x) = x)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((fun x  -> ((f x), (not ((f x) = x)))), b);;

*)

(* changed spans
(4,41)-(4,60)
(f x , not (f x = x))
TupleG [AppG [EmptyG],AppG [EmptyG]]

*)

(* type error slice
(2,4)-(2,80)
(2,17)-(2,78)
(2,24)-(2,78)
(2,38)-(2,39)
(2,38)-(2,41)
(2,40)-(2,41)
(2,56)-(2,62)
(2,56)-(2,70)
(2,63)-(2,70)
(2,67)-(2,69)
(4,22)-(4,28)
(4,22)-(4,65)
(4,29)-(4,65)
(4,30)-(4,61)
(4,41)-(4,42)
(4,41)-(4,60)
(4,49)-(4,60)
(4,50)-(4,55)
(4,51)-(4,52)
(4,58)-(4,59)
*)
