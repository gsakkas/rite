
let rec wwhile (f,b) =
  let (b',c') = f b in if not c' then b' else wwhile (f, b');;

let fixpoint (f,b) = wwhile ((f, ((f b) != b)), b);;


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
CaseG VarG (fromList [(LitPatG,Nothing,VarG),(WildPatG,Nothing,AppG (fromList [EmptyG]))])

(5,30)-(5,47)
fun f' ->
  if f b = b
  then (b , true)
  else (b , false)
LamG VarPatG (IteG EmptyG EmptyG EmptyG)

*)

(* type error slice
(3,17)-(3,18)
(3,17)-(3,20)
(3,47)-(3,53)
(3,47)-(3,61)
(3,54)-(3,61)
(3,55)-(3,56)
(5,22)-(5,28)
(5,22)-(5,51)
(5,29)-(5,51)
(5,30)-(5,47)
*)
