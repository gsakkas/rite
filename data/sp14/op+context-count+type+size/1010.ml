
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
(5,32)-(5,35)
(5,32)-(5,47)
(5,32)-(5,53)
(5,39)-(5,40)
(5,39)-(5,47)
(5,44)-(5,45)
(5,44)-(5,47)
(5,46)-(5,47)
*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,51)-(3,57)
(3,51)-(3,63)
(3,59)-(3,60)
(3,59)-(3,63)
(5,22)-(5,28)
(5,22)-(5,53)
(5,32)-(5,47)
(5,32)-(5,53)
*)
