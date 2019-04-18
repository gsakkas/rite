
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile f b' else b';;


(* fix

let rec wwhile (f,b) = let (b',c') = f b in if c' then wwhile (f, b') else b';;

*)

(* changed spans
(3,27)-(3,36)
c'
VarG

(3,42)-(3,53)
wwhile (f , b')
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(3,63)
(2,17)-(3,61)
(3,42)-(3,48)
(3,42)-(3,53)
(3,49)-(3,50)
*)
