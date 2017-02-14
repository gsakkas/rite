
let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) = wwhile (((f b), (b = (f b))), b);;


(* fix

let rec wwhile (f,b) =
  match f b with | (x,false ) -> x | (x,true ) -> wwhile (f, x);;

let fixpoint (f,b) =
  wwhile (let g x = let bb = f b in (bb, (bb = b)) in (g, b));;

*)

(* changed spans
(5,28)-(5,53)
(5,29)-(5,49)
(5,30)-(5,35)
(5,37)-(5,48)
(5,38)-(5,39)
(5,42)-(5,47)
(5,43)-(5,44)
(5,45)-(5,46)
*)

(* type error slice
(3,8)-(3,9)
(3,8)-(3,11)
(3,50)-(3,56)
(3,50)-(3,63)
(3,57)-(3,63)
(3,58)-(3,59)
(5,21)-(5,27)
(5,21)-(5,53)
(5,28)-(5,53)
(5,29)-(5,49)
*)
