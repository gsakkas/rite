
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (if (f b) = b then ((f b), b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,30)-(6,57)
(6,34)-(6,37)
(6,34)-(6,42)
(6,41)-(6,42)
(6,50)-(6,57)
*)

(* type error slice
(2,4)-(4,17)
(2,17)-(4,14)
(4,11)-(4,12)
(4,11)-(4,14)
(4,13)-(4,14)
(6,22)-(6,28)
(6,22)-(6,57)
(6,30)-(6,57)
(6,30)-(6,57)
(6,30)-(6,57)
(6,34)-(6,35)
(6,34)-(6,37)
(6,34)-(6,42)
(6,34)-(6,42)
(6,41)-(6,42)
(6,50)-(6,51)
(6,50)-(6,53)
(6,50)-(6,57)
(6,56)-(6,57)
*)
