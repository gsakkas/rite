
let g (f,x) = let xx = f x in (xx, (xx = (f xx)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;



let g h x = let xx = h x in (xx, (xx = (h x)));;

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile ((g f), b);;


(* changed spans
(2,7)-(2,10)
(2,11)-(2,12)
(2,24)-(2,25)
(2,43)-(2,47)
*)

(* type error slice
(4,56)-(4,69)
(6,22)-(6,38)
*)
