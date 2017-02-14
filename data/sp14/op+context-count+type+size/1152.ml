
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile (if b = (f b) then (b, false) else ((b, true), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(6,2)-(6,8)
(6,2)-(6,59)
(6,9)-(6,59)
(6,45)-(6,54)
(6,56)-(6,57)
*)

(* type error slice
(6,9)-(6,59)
(6,9)-(6,59)
(6,28)-(6,38)
(6,29)-(6,30)
(6,44)-(6,58)
(6,45)-(6,54)
(6,46)-(6,47)
*)
