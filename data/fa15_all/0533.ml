
let rec wwhile (f,b) =
  let (b',c') = b in match c' with | true  -> wwhile (f, b') | false  -> b';;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | true  -> wwhile (f, b') | false  -> b';;

*)

(* changed spans
(3,16)-(3,17)
f
VarG

(3,16)-(3,17)
f b
AppG (fromList [VarG])

*)
