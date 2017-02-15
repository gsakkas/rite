
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (if (f b) = b then (f, b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,28)-(6,54)
(6,29)-(6,53)
(6,32)-(6,41)
(6,47)-(6,53)
(6,48)-(6,49)
*)

(* type error slice
(2,3)-(4,16)
(2,16)-(4,14)
(3,2)-(4,14)
(3,18)-(3,66)
(3,52)-(3,58)
(3,53)-(3,54)
(3,55)-(3,57)
(4,2)-(4,8)
(4,2)-(4,14)
(4,9)-(4,14)
(4,10)-(4,11)
(6,21)-(6,27)
(6,21)-(6,54)
(6,28)-(6,54)
(6,28)-(6,54)
(6,29)-(6,53)
(6,32)-(6,37)
(6,32)-(6,41)
(6,32)-(6,41)
(6,33)-(6,34)
(6,35)-(6,36)
(6,40)-(6,41)
(6,47)-(6,53)
(6,48)-(6,49)
*)
