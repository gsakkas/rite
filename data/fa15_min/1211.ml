
let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else f b';;


(* fix

let rec wwhile (f,b) =
  match f b with | (b',c') -> if c' = false then b' else wwhile (f, b');;

*)

(* changed spans
(3,58)-(3,62)
wwhile (f , b')
AppG [TupleG [EmptyG,EmptyG]]

*)

(* type error slice
(3,3)-(3,62)
(3,9)-(3,10)
(3,9)-(3,12)
(3,31)-(3,62)
(3,50)-(3,52)
(3,58)-(3,59)
(3,58)-(3,62)
*)
