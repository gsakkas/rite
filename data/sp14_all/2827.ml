
let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> (f, ((f b) != b))), b);;


(* fix

let rec wwhile (f,b) =
  let rec helper (b',c') = if c' = true then helper (f b') else b' in
  helper (f b);;

let fixpoint (f,b) = wwhile ((fun b  -> ((f b), ((f b) != b))), b);;

*)

(* changed spans
(6,42)-(6,43)
f b
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(4,17)
(2,17)-(4,15)
(3,3)-(4,15)
(3,19)-(3,67)
(3,53)-(3,59)
(3,54)-(3,55)
(3,56)-(3,58)
(4,3)-(4,9)
(4,3)-(4,15)
(4,10)-(4,15)
(4,11)-(4,12)
(6,22)-(6,28)
(6,22)-(6,63)
(6,29)-(6,63)
(6,30)-(6,59)
(6,41)-(6,58)
(6,42)-(6,43)
(6,46)-(6,51)
(6,47)-(6,48)
(6,49)-(6,50)
*)
