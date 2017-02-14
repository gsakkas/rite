
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
(6,18)-(6,48)
(6,27)-(6,30)
(6,29)-(6,30)
(6,45)-(6,46)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(6,2)-(6,8)
(6,2)-(6,59)
(6,9)-(6,59)
(6,9)-(6,59)
(6,18)-(6,48)
(6,34)-(6,48)
(6,52)-(6,58)
(6,53)-(6,54)
*)
