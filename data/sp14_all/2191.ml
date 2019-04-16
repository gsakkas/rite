
let rec wwhile (f,b) =
  let check = f b in
  match (f, b) with | (x,y) -> if y = false then x else wwhile (f, x);;


(* fix

let rec wwhile (f,b) =
  let check = f b in
  match check with | (x,y) -> if y = false then x else wwhile (f, x);;

*)

(* changed spans
(4,9)-(4,15)
check
VarG

*)

(* type error slice
(2,4)-(4,72)
(2,17)-(4,70)
(3,15)-(3,16)
(3,15)-(3,18)
(4,3)-(4,70)
(4,9)-(4,15)
(4,10)-(4,11)
(4,13)-(4,14)
(4,35)-(4,36)
(4,35)-(4,44)
(4,39)-(4,44)
(4,57)-(4,63)
(4,57)-(4,70)
(4,64)-(4,70)
(4,68)-(4,69)
*)
