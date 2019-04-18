
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((if (f b) = b then b else f b), b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in match c' with | false  -> b' | _ -> wwhile (f, b');;

let fixpoint (f,b) =
  wwhile ((fun f'  -> if (f b) = b then (b, true) else (b, false)), b);;

*)

(* changed spans
(3,24)-(3,61)
match c' with
| false -> b'
| _ -> wwhile (f , b')
CaseG (fromList [(LitPatG,Nothing,VarG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

(5,30)-(5,60)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
LamG VarPatG (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(3,3)-(3,61)
(3,17)-(3,18)
(3,17)-(3,20)
(3,47)-(3,53)
(3,47)-(3,61)
(3,54)-(3,61)
(3,55)-(3,56)
(3,58)-(3,60)
(5,22)-(5,28)
(5,22)-(5,64)
(5,29)-(5,64)
(5,30)-(5,60)
(5,34)-(5,39)
(5,34)-(5,43)
(5,35)-(5,36)
(5,42)-(5,43)
(5,56)-(5,57)
(5,56)-(5,59)
(5,62)-(5,63)
*)
