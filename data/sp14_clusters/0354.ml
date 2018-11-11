
let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile func else value;;


(* fix

let rec wwhile (f,b) =
  let func = f b in
  let (value,boo) = func in if boo then wwhile (f, value) else value;;

*)

(* changed spans
(4,47)-(4,51)
(f , value)
TupleG [VarG,VarG]

(4,57)-(4,62)
f
VarG

*)
