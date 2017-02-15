
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((f, ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (let h x = ((f x), ((f x) = x)) in (h, b));;

*)

(* changed spans
(4,28)-(4,49)
(4,29)-(4,45)
(4,30)-(4,31)
(4,33)-(4,44)
(4,37)-(4,38)
(4,42)-(4,43)
(4,47)-(4,48)
*)

(* type error slice
(2,37)-(2,38)
(2,37)-(2,40)
(2,55)-(2,61)
(2,55)-(2,69)
(2,62)-(2,69)
(2,63)-(2,64)
(4,21)-(4,27)
(4,21)-(4,49)
(4,28)-(4,49)
(4,29)-(4,45)
*)
