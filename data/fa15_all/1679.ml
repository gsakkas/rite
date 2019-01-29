
let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' = if (f b) = b then (b, true) else (b, false) in wwhile (f', b);;


(* fix

let rec wwhile (f,b) =
  let (b',c') = f b in if c' = true then wwhile (f, b') else b';;

let fixpoint (f,b) =
  let f' b' = if (f b') = b' then (b', true) else (b', false) in
  wwhile (f', b);;

*)

(* changed spans
(6,11)-(6,54)
fun b' ->
  if f b' = b'
  then (b' , true)
  else (b' , false)
LamG (IteG EmptyG EmptyG EmptyG)

(6,22)-(6,23)
b'
VarG

(6,29)-(6,38)
b'
VarG

(6,30)-(6,31)
b'
VarG

(6,45)-(6,46)
b'
VarG

*)
