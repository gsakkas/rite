
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((f ((f b) = b)), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,31)-(6,43)
(6,35)-(6,43)
*)

(* type error slice
(2,4)-(4,17)
(2,17)-(4,14)
(4,11)-(4,12)
(4,11)-(4,14)
(6,22)-(6,28)
(6,22)-(6,48)
(6,31)-(6,32)
(6,31)-(6,43)
(6,31)-(6,48)
(6,35)-(6,36)
(6,35)-(6,38)
(6,35)-(6,43)
(6,35)-(6,43)
(6,35)-(6,43)
(6,37)-(6,38)
(6,42)-(6,43)
*)
