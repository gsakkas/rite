
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let h x = (f, ((f x) = x)) in (h, b));;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let h x = ((f x), ((f x) != x)) in (h, b));;

*)

(* changed spans
(4,41)-(4,42)
f x
AppG [VarG]

(4,44)-(4,55)
f x <> x
BopG (AppG [EmptyG]) VarG

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
(4,22)-(4,67)
(4,29)-(4,67)
(4,36)-(4,56)
(4,40)-(4,56)
(4,41)-(4,42)
(4,45)-(4,50)
(4,46)-(4,47)
(4,48)-(4,49)
(4,60)-(4,66)
(4,61)-(4,62)
*)
