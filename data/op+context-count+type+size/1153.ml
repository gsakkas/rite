
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
(7,12)-(7,20)
(7,23)-(7,24)
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
(6,3)-(7,24)
(6,14)-(6,60)
(6,18)-(6,60)
(6,21)-(6,22)
(6,21)-(6,29)
(6,37)-(6,38)
(6,37)-(6,45)
(6,40)-(6,45)
(7,3)-(7,9)
(7,3)-(7,24)
(7,12)-(7,18)
(7,12)-(7,20)
(7,12)-(7,24)
(7,19)-(7,20)
(7,23)-(7,24)
*)
