
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g = let bb = f b in (bb, (bb = b)) in (g, b));;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g x = let bb = f x in (bb, (bb = x)) in (g, b));;

*)

(* changed spans
(6,19)-(6,47)
(6,28)-(6,31)
(6,30)-(6,31)
(6,46)-(6,47)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,51)-(3,57)
(3,51)-(3,63)
(3,59)-(3,60)
(3,59)-(3,63)
(6,3)-(6,9)
(6,3)-(6,58)
(6,11)-(6,58)
(6,11)-(6,58)
(6,19)-(6,47)
(6,36)-(6,47)
(6,54)-(6,55)
(6,54)-(6,58)
*)
