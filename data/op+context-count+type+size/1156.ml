
let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) = wwhile (if b = (f b) then b else ((f b), b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (i,true ) -> wwhile (f, i) | (i,false ) -> i;;

let fixpoint (f,b) =
  let helper x = if b = (f b) then (b, false) else (b, true) in
  wwhile (helper, b);;

*)

(* changed spans
(5,22)-(5,28)
(5,22)-(5,64)
(5,30)-(5,64)
(5,48)-(5,49)
(5,57)-(5,58)
(5,57)-(5,60)
(5,63)-(5,64)
*)

(* type error slice
(5,30)-(5,64)
(5,30)-(5,64)
(5,48)-(5,49)
(5,57)-(5,64)
(5,63)-(5,64)
*)
