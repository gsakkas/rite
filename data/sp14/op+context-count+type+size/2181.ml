
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
(6,28)-(6,58)
(6,29)-(6,57)
(6,32)-(6,37)
(6,32)-(6,41)
(6,40)-(6,41)
(6,47)-(6,57)
*)

(* type error slice
(2,3)-(4,16)
(2,16)-(4,14)
(4,9)-(4,14)
(4,10)-(4,11)
(4,12)-(4,13)
(6,21)-(6,27)
(6,21)-(6,58)
(6,28)-(6,58)
(6,28)-(6,58)
(6,29)-(6,57)
(6,32)-(6,37)
(6,32)-(6,41)
(6,32)-(6,41)
(6,33)-(6,34)
(6,40)-(6,41)
(6,47)-(6,57)
(6,48)-(6,53)
(6,49)-(6,50)
(6,55)-(6,56)
*)
