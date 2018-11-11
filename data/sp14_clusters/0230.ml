
let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then b' else f b';;


(* fix

let rec wwhile (f,b) =
  let y = f b in match y with | (b',c') -> if c' then b' else wwhile (f, b');;

*)

(* changed spans
(3,62)-(3,63)
wwhile
VarG

(3,62)-(3,63)
(f , b')
TupleG [VarG,VarG]

*)
