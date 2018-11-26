
let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then f b' else b';;


(* fix

let rec wwhile (f,b) =
  let calc = f b in let (b',c') = calc in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(3,53)-(3,54)
wwhile
VarG

(3,53)-(3,54)
(f , b')
TupleG (fromList [VarG])

*)
