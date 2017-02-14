
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile (f, (f b));;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,29)-(6,30)
(6,32)-(6,37)
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
(4,12)-(4,13)
(6,21)-(6,27)
(6,21)-(6,38)
(6,28)-(6,38)
(6,29)-(6,30)
(6,32)-(6,37)
(6,33)-(6,34)
*)
