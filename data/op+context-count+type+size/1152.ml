
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  wwhile ((if b = (f b) then (b, false) else (b, true)), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(6,3)-(6,9)
(6,3)-(6,59)
(6,12)-(6,54)
(6,12)-(6,59)
(6,58)-(6,59)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,11)-(3,12)
(3,33)-(3,39)
(3,33)-(3,45)
(3,41)-(3,42)
(3,41)-(3,45)
(3,44)-(3,45)
(6,3)-(6,9)
(6,3)-(6,59)
(6,12)-(6,54)
(6,12)-(6,59)
(6,15)-(6,16)
(6,15)-(6,23)
(6,31)-(6,32)
(6,31)-(6,39)
(6,34)-(6,39)
(6,58)-(6,59)
*)
