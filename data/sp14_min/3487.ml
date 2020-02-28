
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' then wwhile (f, b') else b';;

let fixpoint (f,b) = wwhile (((f b) = b), b);;


(* fix

let fixpoint (f,b) = 0;;

*)

(* changed spans
(5,22)-(5,45)
0
LitG

*)

(* type error slice
(3,9)-(3,10)
(3,9)-(3,12)
(3,42)-(3,48)
(3,42)-(3,56)
(3,49)-(3,56)
(3,50)-(3,51)
(5,22)-(5,28)
(5,22)-(5,45)
(5,29)-(5,45)
(5,30)-(5,41)
*)
