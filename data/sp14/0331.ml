
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile ((helper b), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(7,11)-(7,21)
helper
VarG

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,33)-(3,39)
(3,33)-(3,46)
(3,40)-(3,46)
(3,41)-(3,42)
(6,3)-(7,25)
(6,14)-(6,61)
(6,18)-(6,61)
(6,52)-(6,61)
(7,3)-(7,9)
(7,3)-(7,25)
(7,10)-(7,25)
(7,11)-(7,21)
(7,12)-(7,18)
*)
