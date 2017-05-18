
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = ((wwhile (wwhile (f, (f b)))), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) = b))), b);;

*)

(* changed spans
(6,21)-(6,54)
(6,30)-(6,49)
(6,31)-(6,37)
(6,39)-(6,40)
(6,42)-(6,47)
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
(6,30)-(6,49)
(6,31)-(6,37)
(6,38)-(6,48)
(6,39)-(6,40)
(6,42)-(6,47)
(6,43)-(6,44)
*)

(* all spans
(2,16)-(4,14)
(3,2)-(4,14)
(3,18)-(3,66)
(3,27)-(3,66)
(3,30)-(3,39)
(3,30)-(3,32)
(3,35)-(3,39)
(3,45)-(3,58)
(3,45)-(3,51)
(3,52)-(3,58)
(3,53)-(3,54)
(3,55)-(3,57)
(3,64)-(3,66)
(4,2)-(4,14)
(4,2)-(4,8)
(4,9)-(4,14)
(4,10)-(4,11)
(4,12)-(4,13)
(6,14)-(6,54)
(6,21)-(6,54)
(6,22)-(6,50)
(6,23)-(6,29)
(6,30)-(6,49)
(6,31)-(6,37)
(6,38)-(6,48)
(6,39)-(6,40)
(6,42)-(6,47)
(6,43)-(6,44)
(6,45)-(6,46)
(6,52)-(6,53)
*)
