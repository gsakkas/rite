
let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile f a;;


(* fix

let rec wwhile (f,b) =
  match f b with | (a,c) -> if not c then a else wwhile (f, a);;

*)

(* changed spans
(3,49)-(3,59)
wwhile (f , a)
AppG [TupleG [EmptyG,EmptyG]]

(3,56)-(3,57)
(f , a)
TupleG [VarG,VarG]

*)
