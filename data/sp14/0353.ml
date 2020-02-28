
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (func, boo) else value;;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

*)

(* changed spans
(4,49)-(4,53)
f
VarG

(4,55)-(4,58)
value
VarG

*)

(* type error slice
(2,4)-(4,72)
(2,17)-(4,70)
(3,14)-(3,15)
(3,14)-(3,17)
(4,3)-(4,70)
(4,21)-(4,25)
(4,41)-(4,47)
(4,41)-(4,59)
(4,48)-(4,59)
(4,49)-(4,53)
*)
