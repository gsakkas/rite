
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
(5,21)-(5,27)
(5,21)-(5,65)
(5,28)-(5,65)
(5,47)-(5,48)
(5,55)-(5,60)
(5,56)-(5,57)
(5,62)-(5,63)
*)

(* type error slice
(5,28)-(5,65)
(5,28)-(5,65)
(5,47)-(5,48)
(5,54)-(5,64)
(5,62)-(5,63)
*)
