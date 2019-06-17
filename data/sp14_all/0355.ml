
let rec wwhile (f,b) =
  let func = f b in let (value,boo) = func in if boo then wwhile f else value;;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

*)

(* changed spans
(3,66)-(3,67)
(f , value)
TupleG [VarG,VarG]

*)

(* type error slice
(2,4)-(3,80)
(2,17)-(3,78)
(3,59)-(3,65)
(3,59)-(3,67)
(3,66)-(3,67)
*)
