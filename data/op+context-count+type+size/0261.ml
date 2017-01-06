
let g f b = (b, (b = (f b)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (g, b);;



let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;


(* changed spans
(2,7)-(2,10)
(2,14)-(2,15)
(2,18)-(2,19)
(2,23)-(2,26)
*)

(* type error slice
(4,56)-(4,69)
(6,22)-(6,34)
*)
