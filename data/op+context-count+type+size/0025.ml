
let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f' f b = ((f b), (b = (f b))) in wwhile (f', b);;



let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = let f b = ((f b), ((f b) = b)) in wwhile (f, b);;


(* changed spans
(4,26)-(4,28)
(4,44)-(4,47)
(4,67)-(4,69)
*)

(* type error slice
(2,56)-(2,69)
(4,59)-(4,72)
*)
