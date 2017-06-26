
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
(6,51)-(6,60)
(7,2)-(7,8)
(7,2)-(7,24)
(7,9)-(7,24)
(7,10)-(7,20)
(7,11)-(7,17)
*)

(* all spans
(2,16)-(3,63)
(3,2)-(3,63)
(3,8)-(3,11)
(3,8)-(3,9)
(3,10)-(3,11)
(3,32)-(3,45)
(3,32)-(3,38)
(3,39)-(3,45)
(3,40)-(3,41)
(3,43)-(3,44)
(3,62)-(3,63)
(5,14)-(7,24)
(6,2)-(7,24)
(6,13)-(6,60)
(6,17)-(6,60)
(6,20)-(6,29)
(6,20)-(6,21)
(6,24)-(6,29)
(6,25)-(6,26)
(6,27)-(6,28)
(6,35)-(6,45)
(6,36)-(6,37)
(6,39)-(6,44)
(6,51)-(6,60)
(6,52)-(6,53)
(6,55)-(6,59)
(7,2)-(7,24)
(7,2)-(7,8)
(7,9)-(7,24)
(7,10)-(7,20)
(7,11)-(7,17)
(7,18)-(7,19)
(7,22)-(7,23)
*)
