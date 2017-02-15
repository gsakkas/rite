
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
(7,10)-(7,20)
(7,22)-(7,23)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,32)-(3,38)
(3,32)-(3,45)
(3,39)-(3,45)
(3,40)-(3,41)
(6,2)-(7,24)
(6,13)-(6,60)
(6,17)-(6,60)
(6,35)-(6,45)
(7,2)-(7,8)
(7,2)-(7,24)
(7,9)-(7,24)
(7,10)-(7,20)
(7,11)-(7,17)
*)
